unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus;

type

  { TfrmPrincipal }

  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    mnCadastro: TMenuItem;
    smClientes: TMenuItem;
    mSair: TMenuItem;
    procedure MenuItem1Click(Sender: TObject);
    procedure mSairClick(Sender: TObject);
    procedure smClientesClick(Sender: TObject);
  private

  public

  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.lfm}

{ TfrmPrincipal }

procedure TfrmPrincipal.MenuItem1Click(Sender: TObject);
begin

end;

procedure TfrmPrincipal.mSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.smClientesClick(Sender: TObject);
begin
  frmClientes.Showmodal;
end;

end.

