unit uCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, System.Hash;

type
  TfrmCadastro = class(TForm)
    pnlTopo: TPanel;
    lblTituloCad: TLabel;
    lblNome: TLabel;
    edtNome: TEdit;
    lblEmail: TLabel;
    edtEmail: TEdit;
    lblLogin: TLabel;
    edtLogin: TEdit;
    lblSenha: TLabel;
    edtSenha: TEdit;
    chkAtivo: TCheckBox;
    pnlBotoes: TPanel;
    btnSalvar: TButton;
    btnCancelar: TButton;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FIdUsuario: Integer;
    procedure CarregarDados;
    function Validar: Boolean;
    function HashSenha(const ASenha: string): string;
  public
    property IdUsuario: Integer read FIdUsuario write FIdUsuario;
  end;

implementation

uses
  uDM, FireDAC.Comp.Client;

{$R *.dfm}

procedure TfrmCadastro.FormShow(Sender: TObject);
begin
  if FIdUsuario > 0 then
  begin
    lblTituloCad.Caption := 'Editar Usu'#225'rio';
    CarregarDados;
  end
  else
  begin
    lblTituloCad.Caption := 'Novo Usu'#225'rio';
    chkAtivo.Checked := True;
  end;
  edtNome.SetFocus;
end;

procedure TfrmCadastro.CarregarDados;
var
  qry: TFDQuery;
begin
  qry := TFDQuery.Create(nil);
  try
    qry.Connection := DM.FDConnection;
    qry.SQL.Text := 'SELECT * FROM USUARIOS WHERE ID = :ID';
    qry.ParamByName('ID').AsInteger := FIdUsuario;
    qry.Open;

    if not qry.IsEmpty then
    begin
      edtNome.Text := qry.FieldByName('NOME').AsString;
      edtEmail.Text := qry.FieldByName('EMAIL').AsString;
      edtLogin.Text := qry.FieldByName('LOGIN').AsString;
      edtSenha.Text := '';
      edtSenha.TextHint := '(deixe em branco para manter a senha atual)';
      chkAtivo.Checked := qry.FieldByName('ATIVO').AsInteger = 1;
    end;
  finally
    qry.Free;
  end;
end;

function TfrmCadastro.Validar: Boolean;
begin
  Result := False;

  if Trim(edtNome.Text) = '' then
  begin
    ShowMessage('Informe o nome do usu'#225'rio.');
    edtNome.SetFocus;
    Exit;
  end;

  if Trim(edtLogin.Text) = '' then
  begin
    ShowMessage('Informe o login do usu'#225'rio.');
    edtLogin.SetFocus;
    Exit;
  end;

  if (FIdUsuario = 0) and (Trim(edtSenha.Text) = '') then
  begin
    ShowMessage('Informe a senha do usu'#225'rio.');
    edtSenha.SetFocus;
    Exit;
  end;

  if (Trim(edtEmail.Text) <> '') and (Pos('@', edtEmail.Text) = 0) then
  begin
    ShowMessage('Informe um e-mail v'#225'lido.');
    edtEmail.SetFocus;
    Exit;
  end;

  Result := True;
end;

function TfrmCadastro.HashSenha(const ASenha: string): string;
begin
  Result := THashSHA2.GetHashString(ASenha, SHA256);
end;

procedure TfrmCadastro.btnSalvarClick(Sender: TObject);
var
  Ativo: Integer;
begin
  if not Validar then
    Exit;

  if chkAtivo.Checked then
    Ativo := 1
  else
    Ativo := 0;

  if FIdUsuario = 0 then
  begin
    // Inserir novo usu�rio
    DM.FDConnection.ExecSQL(
      'INSERT INTO USUARIOS (NOME, EMAIL, LOGIN, SENHA, ATIVO) ' +
      'VALUES (:NOME, :EMAIL, :LOGIN, :SENHA, :ATIVO)',
      [Trim(edtNome.Text), Trim(edtEmail.Text), Trim(edtLogin.Text),
       HashSenha(edtSenha.Text), Ativo]
    );
  end
  else
  begin
    // Atualizar usu�rio existente
    if Trim(edtSenha.Text) <> '' then
    begin
      DM.FDConnection.ExecSQL(
        'UPDATE USUARIOS SET NOME = :NOME, EMAIL = :EMAIL, LOGIN = :LOGIN, ' +
        'SENHA = :SENHA, ATIVO = :ATIVO WHERE ID = :ID',
        [Trim(edtNome.Text), Trim(edtEmail.Text), Trim(edtLogin.Text),
         HashSenha(edtSenha.Text), Ativo, FIdUsuario]
      );
    end
    else
    begin
      DM.FDConnection.ExecSQL(
        'UPDATE USUARIOS SET NOME = :NOME, EMAIL = :EMAIL, LOGIN = :LOGIN, ' +
        'ATIVO = :ATIVO WHERE ID = :ID',
        [Trim(edtNome.Text), Trim(edtEmail.Text), Trim(edtLogin.Text),
         Ativo, FIdUsuario]
      );
    end;
  end;

  ModalResult := mrOk;
end;

procedure TfrmCadastro.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
