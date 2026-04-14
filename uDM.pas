unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  Data.DB;

type
  TDM = class(TDataModule)
    FDConnection: TFDConnection;
    qryUsuarios: TFDQuery;
    dsUsuarios: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure CriarBanco;
  public
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  FDConnection.Params.Database := ExtractFilePath(ParamStr(0)) + 'usuarios.db';
  FDConnection.Connected := True;
  CriarBanco;

  qryUsuarios.SQL.Text :=
    'SELECT ID, NOME, EMAIL, LOGIN, SENHA, ATIVO, DATA_CADASTRO FROM USUARIOS ORDER BY NOME';
  qryUsuarios.Open;
end;

procedure TDM.CriarBanco;
begin
  FDConnection.ExecSQL(
    'CREATE TABLE IF NOT EXISTS USUARIOS (' +
    '  ID INTEGER PRIMARY KEY AUTOINCREMENT,' +
    '  NOME VARCHAR(100) NOT NULL,' +
    '  EMAIL VARCHAR(150),' +
    '  LOGIN VARCHAR(50) NOT NULL,' +
    '  SENHA VARCHAR(100) NOT NULL,' +
    '  ATIVO INTEGER DEFAULT 1,' +
    '  DATA_CADASTRO DATETIME DEFAULT CURRENT_TIMESTAMP' +
    ')'
  );
end;

end.
