object FPrincipal: TFPrincipal
  Left = 619
  Top = 176
  Width = 691
  Height = 480
  Caption = 'FPrincipal'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object ator: TMenuItem
        Caption = 'Ator'
        OnClick = atorClick
      end
      object livro: TMenuItem
        Caption = 'Livro'
        OnClick = livroClick
      end
      object categoria: TMenuItem
        Caption = 'Categoria'
        OnClick = categoriaClick
      end
    end
  end
end
