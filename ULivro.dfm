inherited FLivro: TFLivro
  Left = 127
  Top = 147
  Height = 624
  Caption = 'Livro'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Height = 556
    ActivePage = tbDados
    inherited tbDados: TTabSheet
      inherited grDados: TGroupBox
        Height = 528
        object Label1: TLabel
          Left = 94
          Top = 48
          Width = 31
          Height = 13
          Caption = 'idLivro'
          FocusControl = DBEdit1
        end
        object Label2: TLabel
          Left = 94
          Top = 88
          Width = 25
          Height = 13
          Caption = 'ISBN'
          FocusControl = DBEdit2
        end
        object Label3: TLabel
          Left = 94
          Top = 128
          Width = 26
          Height = 13
          Caption = 'Titulo'
          FocusControl = DBEdit3
        end
        object Label4: TLabel
          Left = 94
          Top = 168
          Width = 19
          Height = 13
          Caption = 'Ano'
          FocusControl = DBEdit4
        end
        object Label7: TLabel
          Left = 96
          Top = 264
          Width = 76
          Height = 13
          Caption = 'Lista de Autores'
        end
        object Label8: TLabel
          Left = 96
          Top = 216
          Width = 45
          Height = 13
          Caption = 'Categoria'
          FocusControl = cmbCategoria
        end
        object DBEdit1: TDBEdit
          Left = 94
          Top = 64
          Width = 134
          Height = 21
          TabStop = False
          Color = clScrollBar
          DataField = 'idLivro'
          DataSource = ds
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 94
          Top = 104
          Width = 235
          Height = 21
          DataField = 'ISBN'
          DataSource = ds
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 94
          Top = 144
          Width = 291
          Height = 21
          DataField = 'Titulo'
          DataSource = ds
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 94
          Top = 184
          Width = 134
          Height = 21
          DataField = 'Ano'
          DataSource = ds
          TabOrder = 3
        end
        object DBGrid2: TDBGrid
          Left = 96
          Top = 288
          Width = 353
          Height = 105
          DataSource = dm.DataSource1
          TabOrder = 4
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
        object gAutor: TGroupBox
          Left = 400
          Top = 48
          Width = 617
          Height = 145
          Caption = 'Inserir Autor'
          TabOrder = 5
          Visible = False
          object Label5: TLabel
            Left = 14
            Top = 36
            Width = 38
            Height = 13
            Caption = 'Escolha'
          end
          object btnDel: TButton
            Left = 240
            Top = 56
            Width = 41
            Height = 25
            Caption = '-'
            TabOrder = 0
            OnClick = btnDelClick
          end
          object btAdd: TButton
            Left = 184
            Top = 56
            Width = 41
            Height = 25
            Caption = '+'
            TabOrder = 1
            OnClick = btAddClick
          end
          object ComboBox1: TComboBox
            Left = 16
            Top = 64
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 2
            OnEnter = ComboBox1Enter
          end
          object ListBox1: TListBox
            Left = 344
            Top = 16
            Width = 241
            Height = 97
            ItemHeight = 13
            TabOrder = 3
          end
        end
        object DBEdit5: TDBEdit
          Left = 96
          Top = 232
          Width = 33
          Height = 21
          DataField = 'idCategoria'
          DataSource = ds
          TabOrder = 6
          Visible = False
        end
        object cmbCategoria: TDBLookupComboBox
          Left = 96
          Top = 232
          Width = 274
          Height = 21
          DataField = 'Categoria'
          DataSource = ds
          TabOrder = 7
        end
      end
    end
    inherited tbFiltros: TTabSheet
      inherited DBGrid1: TDBGrid
        Height = 423
      end
    end
  end
  inherited ds: TDataSource
    DataSet = dm.MLivro
    Left = 272
  end
  object DataSource1: TDataSource
    Left = 560
    Top = 296
  end
end
