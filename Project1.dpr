program Project1;

uses
  Forms,
  UPrincipal in 'UPrincipal.pas' {FPrincipal},
  UDAO in 'UDAO.pas' {dm: TDataModule},
  UPadrao in 'UPadrao.pas' {FPadrao},
  UAtor in 'UAtor.pas' {FAtor},
  ULivro in 'ULivro.pas' {FLivro},
  UCategoria in 'UCategoria.pas' {FCategoria};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TFAtor, FAtor);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TFPadrao, FPadrao);
  Application.CreateForm(TFLivro, FLivro);
  Application.CreateForm(TFCategoria, FCategoria);
  Application.Run;
end.
