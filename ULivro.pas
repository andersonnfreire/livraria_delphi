unit ULivro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadrao, DB, Grids, DBGrids, StdCtrls, ComCtrls, ToolWin,udao,
  Mask, DBCtrls;

type
  TFLivro = class(TFPadrao)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBGrid2: TDBGrid;
    Label7: TLabel;
    gAutor: TGroupBox;
    btnDel: TButton;
    btAdd: TButton;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    cmbCategoria: TDBLookupComboBox;
    DataSource1: TDataSource;
    ComboBox1: TComboBox;
    ListBox1: TListBox;
    procedure btAddClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLivro: TFLivro;
  valor: Boolean;

implementation

uses DBTables;

{$R *.dfm}

procedure TFLivro.btAddClick(Sender: TObject);
begin
  inherited;
  ListBox1.Items.AddObject(ComboBox1.Items[ComboBox1.ItemIndex],TObject(Integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex])));
  valor:= True;
end;

procedure TFLivro.btSalvarClick(Sender: TObject);
var
i:Integer;
begin
  inherited;
  if valor = True then
  begin
    for i := 0 to ListBox1.Items.Count-1 do
    begin

      dm.QAutorLivro.Close;
      dm.QAutorLivro.SQL.Add('insert into AutorLivro values (:idLivro, :idAutor)');
      dm.QAutorLivro.ParamByName('idLivro').AsInteger := dm.MLivroidLivro.AsInteger;
      dm.QAutorLivro.ParamByName('idAutor').Asinteger := Integer(ListBox1.Items.Objects[i]);
      dm.QAutorLivro.ExecSQL;
    end;
  end;
  ListBox1.Clear;
end;
procedure TFLivro.btCancelarClick(Sender: TObject);
begin
  inherited;
  ListBox1.Clear;
  DBGrid2.Visible    :=  true;
  gAutor.Visible  :=  false;
end;

procedure TFLivro.btNovoClick(Sender: TObject);
begin
  inherited;

  DBGrid2.Visible := false;
  Label7.Visible := false;
  gAutor.Visible := True;
end;

procedure TFLivro.btnDelClick(Sender: TObject);
begin
  inherited;
  ListBox1.DeleteSelected;
end;

procedure TFLivro.btPesquisarClick(Sender: TObject);
begin
  inherited;
   DBGrid2.Visible := True;
   gAutor.Visible := False;
end;

procedure TFLivro.btAlterarClick(Sender: TObject);
begin
  inherited;
  DBGrid2.Visible := True;
  gAutor.Visible := False;
end;

procedure TFLivro.Button1Click(Sender: TObject);
begin
  inherited;
  showmessage(inttostr(dm.QAutLivroNovo.RecordCount));
end;

procedure TFLivro.ComboBox1Enter(Sender: TObject);
begin
  inherited;
  ComboBox1.Items.Clear;
  dm.MAutores.Close;
  dm.MAutores.Open;
  while not dm.MAutores.Eof do
  begin
    ComboBox1.Items.AddObject(dm.MAutoresnome.AsString,TObject(dm.MAutoresidAutor.AsInteger));
    dm.MAutores.Next;
  end;
end;

end.
