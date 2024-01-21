unit uClientes;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls,
  DBGrids, StdCtrls, DBCtrls;

type

  { TfrmClientes }

  TfrmClientes = class(TForm)
    Button1: TButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBNavigator1: TDBNavigator;
    DCLIENTE: TDataSource;
    DBGrid1: TDBGrid;
    edtPesquisa: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    PageControl1: TPageControl;
    Panel1: TPanel;
    rbNome: TRadioButton;
    rbCodigo: TRadioButton;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    procedure Button1Click(Sender: TObject);
    //procedure Label2Click(Sender: TObject);
  private

  public

  end;

var
  frmClientes: TfrmClientes;

implementation
uses uDataGlobal;

{$R *.lfm}

{ TfrmClientes }

procedure TfrmClientes.Button1Click(Sender: TObject);
begin
  DataGlobal.TCliente.Close;
  DataGlobal.TCliente.SQL.Clear;
  DataGlobal.TCliente.SQL.Add('SELECT * FROM CLIENTES');
  if rbNome.Checked then
    begin
      DataGlobal.TCliente.SQL.Add('WHERE NOME LIKE :cNOME');
      DataGlobal.TCliente.SQL.Add('ORDER BY NOME');
      DataGlobal.TCliente.ParamByName('cNOME').AsString:= '%'+edtPesquisa.Text+'%';
    end;
  if rbCodigo.Checked then
    begin
      DataGlobal.TCliente.SQL.Add('WHERE CODIGO = :nCODIGO');
      DataGlobal.TCliente.ParamByName('nCODIGO').AsInteger:= StrToInt(edtPesquisa.Text);
    end;
  DataGlobal.TCliente.Prepare;
  DataGlobal.TCliente.Open;
end;

{ TfrmClientes }



end.

