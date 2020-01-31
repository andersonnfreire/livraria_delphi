inherited FCategoria: TFCategoria
  Left = 205
  Top = 215
  Height = 600
  Caption = 'Categoria'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Height = 532
    inherited tbDados: TTabSheet
      inherited grDados: TGroupBox
        Height = 504
        object Label1: TLabel
          Left = 16
          Top = 24
          Width = 42
          Height = 13
          Caption = 'C'#211'DIGO'
          FocusControl = DBEdit1
        end
        object Label2: TLabel
          Left = 16
          Top = 120
          Width = 62
          Height = 13
          Caption = 'DESCRI'#199#195'O'
        end
        object Label3: TLabel
          Left = 16
          Top = 72
          Width = 32
          Height = 13
          Caption = 'NOME'
          FocusControl = DBEdit3
        end
        object DBEdit1: TDBEdit
          Left = 16
          Top = 40
          Width = 65
          Height = 21
          TabStop = False
          Color = clScrollBar
          DataField = 'codCategoria'
          DataSource = ds
          TabOrder = 0
        end
        object DBEdit3: TDBEdit
          Left = 16
          Top = 88
          Width = 265
          Height = 21
          DataField = 'nome'
          DataSource = ds
          TabOrder = 1
        end
        object DBRichEdit1: TDBRichEdit
          Left = 16
          Top = 136
          Width = 377
          Height = 89
          DataField = 'descricao'
          DataSource = ds
          TabOrder = 2
        end
      end
    end
    inherited tbFiltros: TTabSheet
      inherited DBGrid1: TDBGrid
        Height = 399
      end
    end
  end
  inherited ds: TDataSource
    DataSet = dm.MCategoria
  end
end
