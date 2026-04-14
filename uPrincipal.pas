unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB;

type
  TfrmPrincipal = class(TForm)
    pnlTopo: TPanel;
    lblTitulo: TLabel;
    pnlBotoes: TPanel;
    btnNovo: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    btnAtualizar: TButton;
    dbgUsuarios: TDBGrid;
    pnlBusca: TPanel;
    lblBusca: TLabel;
    edtBusca: TEdit;
    btnBuscar: TButton;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure dbgUsuariosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure edtBuscaKeyPress(Sender: TObject; var Key: Char);
  private
    procedure AtualizarGrid;
    procedure AbrirCadastro(AId: Integer);
  public
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  uDM, uCadastro;

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  AtualizarGrid;
end;

procedure TfrmPrincipal.AtualizarGrid;
begin
  DM.qryUsuarios.Close;
  DM.qryUsuarios.Open;
end;

procedure TfrmPrincipal.AbrirCadastro(AId: Integer);
var
  frm: TfrmCadastro;
begin
  frm := TfrmCadastro.Create(nil);
  try
    frm.IdUsuario := AId;
    if frm.ShowModal = mrOk then
      AtualizarGrid;
  finally
    frm.Free;
  end;
end;

procedure TfrmPrincipal.btnNovoClick(Sender: TObject);
begin
  AbrirCadastro(0);
end;

procedure TfrmPrincipal.btnEditarClick(Sender: TObject);
begin
  if DM.qryUsuarios.IsEmpty then
  begin
    ShowMessage('Nenhum usu�rio selecionado.');
    Exit;
  end;
  AbrirCadastro(DM.qryUsuarios.FieldByName('ID').AsInteger);
end;

procedure TfrmPrincipal.btnExcluirClick(Sender: TObject);
begin
  if DM.qryUsuarios.IsEmpty then
  begin
    ShowMessage('Nenhum usu�rio selecionado.');
    Exit;
  end;

  if MessageDlg('Deseja realmente excluir o usu�rio "' +
    DM.qryUsuarios.FieldByName('NOME').AsString + '"?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DM.FDConnection.ExecSQL(
      'DELETE FROM USUARIOS WHERE ID = :ID',
      [DM.qryUsuarios.FieldByName('ID').AsInteger]
    );
    AtualizarGrid;
  end;
end;

procedure TfrmPrincipal.btnAtualizarClick(Sender: TObject);
begin
  edtBusca.Clear;
  DM.qryUsuarios.SQL.Text :=
    'SELECT ID, NOME, EMAIL, LOGIN, SENHA, ATIVO, DATA_CADASTRO FROM USUARIOS ORDER BY NOME';
  AtualizarGrid;
end;

procedure TfrmPrincipal.btnBuscarClick(Sender: TObject);
var
  Filtro: string;
begin
  Filtro := Trim(edtBusca.Text);
  if Filtro = '' then
  begin
    btnAtualizarClick(nil);
    Exit;
  end;

  DM.qryUsuarios.Close;
  DM.qryUsuarios.SQL.Text :=
    'SELECT ID, NOME, EMAIL, LOGIN, SENHA, ATIVO, DATA_CADASTRO FROM USUARIOS ' +
    'WHERE NOME LIKE :FILTRO OR EMAIL LIKE :FILTRO OR LOGIN LIKE :FILTRO ' +
    'ORDER BY NOME';
  DM.qryUsuarios.ParamByName('FILTRO').AsString := '%' + Filtro + '%';
  DM.qryUsuarios.Open;
end;

procedure TfrmPrincipal.edtBuscaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    btnBuscarClick(nil);
  end;
end;

procedure TfrmPrincipal.dbgUsuariosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if Column.FieldName = 'ATIVO' then
  begin
    dbgUsuarios.Canvas.FillRect(Rect);
    if Column.Field.AsInteger = 1 then
      dbgUsuarios.Canvas.TextRect(Rect, Rect.Left + 4, Rect.Top + 2, 'Sim')
    else
      dbgUsuarios.Canvas.TextRect(Rect, Rect.Left + 4, Rect.Top + 2, 'N�o');
  end;
end;

end.
