unit UCategoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadrao, DB, Grids, DBGrids, StdCtrls, ComCtrls, ToolWin,udao,
  Mask, DBCtrls, ExtCtrls;

type
  TFCategoria = class(TFPadrao)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBRichEdit1: TDBRichEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCategoria: TFCategoria;
  valor: Boolean;

implementation

{$R *.dfm}

end.
