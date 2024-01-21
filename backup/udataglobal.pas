unit uDataGlobal;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, IBConnection, SQLDB, DB;

type

  { TDataGlobal }

  TDataGlobal = class(TDataModule)
    Conexao: TIBConnection;
    TCliente: TSQLQuery;
    TClienteBAIRRO: TStringField;
    TClienteCEP: TStringField;
    TClienteCIDADE: TStringField;
    TClienteCODIGO: TLongintField;
    TClienteENDERECO: TStringField;
    TClienteNOME: TStringField;
    TClienteTELEFONE: TStringField;
    TClienteUF: TStringField;
    Transacao: TSQLTransaction;
    procedure TClienteAfterPost(DataSet: TDataSet);
  private

  public

  end;

var
  DataGlobal: TDataGlobal;

implementation

{$R *.lfm}

{ TDataGlobal }

procedure TDataGlobal.TClienteAfterPost(DataSet: TDataSet);
begin
  TCliente.ApplyUpdates;
  Transacao.CommitRetaining;
  TCliente.Refresh;
  TCliente.Close;
  TCliente.SQL.Clear;
  TCliente.SQL.Add('SELECT * FROM CLIENTES');
  TCliente.SQL.Add('ORDER BY NOME');
  TCliente.Prepare;
  TCliente.Open;

end;

end.

