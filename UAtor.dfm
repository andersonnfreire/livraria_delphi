inherited FAtor: TFAtor
  Left = 187
  Top = 329
  Caption = 'Ator'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    ActivePage = tbDados
    inherited tbDados: TTabSheet
      inherited grDados: TGroupBox
        object Label1: TLabel
          Left = 80
          Top = 24
          Width = 45
          Height = 13
          Caption = 'C'#211'DIGO '
          FocusControl = DBEdit1
        end
        object Label2: TLabel
          Left = 80
          Top = 64
          Width = 32
          Height = 13
          Caption = 'NOME'
          FocusControl = DBEdit2
        end
        object Label3: TLabel
          Left = 80
          Top = 104
          Width = 20
          Height = 13
          Caption = 'CPF'
          FocusControl = DBEdit3
        end
        object DBEdit1: TDBEdit
          Left = 80
          Top = 40
          Width = 65
          Height = 21
          Color = clScrollBar
          DataField = 'idAutor'
          DataSource = ds
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 80
          Top = 80
          Width = 409
          Height = 21
          DataField = 'nome'
          DataSource = ds
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 80
          Top = 120
          Width = 169
          Height = 21
          HelpType = htKeyword
          DataField = 'cpf'
          DataSource = ds
          TabOrder = 2
        end
      end
    end
  end
  inherited ds: TDataSource
    DataSet = dm.MAutor
  end
end
