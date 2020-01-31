unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TFPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    ator: TMenuItem;
    livro: TMenuItem;
    categoria: TMenuItem;
    procedure atorClick(Sender: TObject);
    procedure livroClick(Sender: TObject);
    procedure categoriaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

uses ULivro, UAtor, UCategoria;


{$R *.dfm}

procedure TFPrincipal.atorClick(Sender: TObject);
begin
   FAtor.Show;
end;

procedure TFPrincipal.livroClick(Sender: TObject);
begin
  FLivro.show;
end;

procedure TFPrincipal.categoriaClick(Sender: TObject);
begin
  FCategoria.show;
end;

end.
