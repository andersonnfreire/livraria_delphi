unit UDAO;

interface

uses
  SysUtils, Classes, DB, DBTables, ImgList, Controls, Provider, DBClient,Dialogs;

type
  Tdm = class(TDataModule)
    dbifes: TDatabase;
    ImageList1: TImageList;
    QLivro: TQuery;
    MLivro: TClientDataSet;
    PLivro: TDataSetProvider;
    PAutor: TDataSetProvider;
    MAutor: TClientDataSet;
    PCategoria: TDataSetProvider;
    MCategoria: TClientDataSet;
    QAutor: TQuery;
    QCategoria: TQuery;
    QCategoriacodCategoria: TIntegerField;
    QCategoriadescricao: TStringField;
    MCategoriacodCategoria: TIntegerField;
    MCategoriadescricao: TStringField;
    QAux: TQuery;
    QLivroidLivro: TIntegerField;
    QLivroISBN: TStringField;
    QLivroTitulo: TStringField;
    QLivroAno: TIntegerField;
    MLivroidLivro: TIntegerField;
    MLivroISBN: TStringField;
    MLivroTitulo: TStringField;
    MLivroAno: TIntegerField;
    QAutoridAutor: TIntegerField;
    QAutornome: TStringField;
    QAutorcpf: TStringField;
    MAutoridAutor: TIntegerField;
    MAutornome: TStringField;
    MAutorcpf: TStringField;
    QAutLivroNovo: TQuery;
    DataSource1: TDataSource;
    QAutorLivro: TQuery;
    QAutorLivroidLivro: TIntegerField;
    QAutorLivroidAutor: TIntegerField;
    QCategorianome: TStringField;
    MCategorianome: TStringField;
    QLivroidCategoria: TIntegerField;
    MLivroidCategoria: TIntegerField;
    MLivroCategoria: TStringField;
    MAutores: TClientDataSet;
    MAutoresidAutor: TIntegerField;
    MAutoresnome: TStringField;
    procedure MAutorAfterPost(DataSet: TDataSet);
    procedure MAutorAfterDelete(DataSet: TDataSet);
    procedure MAutorAfterCancel(DataSet: TDataSet);
    procedure MLivroAfterPost(DataSet: TDataSet);
    procedure MLivroAfterDelete(DataSet: TDataSet);
    procedure MLivroAfterCancel(DataSet: TDataSet);
    procedure MCategoriaAfterPost(DataSet: TDataSet);
    procedure MCategoriaAfterDelete(DataSet: TDataSet);
    procedure MCategoriaAfterCancel(DataSet: TDataSet);
    procedure MLivroAfterInsert(DataSet: TDataSet);
    procedure MAutorAfterInsert(DataSet: TDataSet);
    procedure MCategoriaAfterInsert(DataSet: TDataSet);
    procedure MLivroAfterScroll(DataSet: TDataSet);
    procedure MLivroBeforeDelete(DataSet: TDataSet);
    procedure MCategoriaBeforeDelete(DataSet: TDataSet);
    procedure MAutorBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    function buscaProximoParametro(p:String):Integer;
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

procedure Tdm.MAutorAfterPost(DataSet: TDataSet);
begin
  MAutor.ApplyUpdates(-1);
end;

procedure Tdm.MAutorAfterDelete(DataSet: TDataSet);
begin
   MAutor.ApplyUpdates(-1);
end;

procedure Tdm.MAutorAfterCancel(DataSet: TDataSet);
begin
    MAutor.CancelUpdates;
end;

procedure Tdm.MLivroAfterPost(DataSet: TDataSet);
begin
  MLivro.ApplyUpdates(-1);
end;

procedure Tdm.MLivroAfterDelete(DataSet: TDataSet);
begin
  MLivro.ApplyUpdates(-1);
end;

procedure Tdm.MLivroAfterCancel(DataSet: TDataSet);
begin
  MLivro.CancelUpdates;
end;

procedure Tdm.MCategoriaAfterPost(DataSet: TDataSet);
begin
  MCategoria.ApplyUpdates(-1);
end;

procedure Tdm.MCategoriaAfterDelete(DataSet: TDataSet);
begin
  MCategoria.ApplyUpdates(-1);
end;

procedure Tdm.MCategoriaAfterCancel(DataSet: TDataSet);
begin
  MCategoria.CancelUpdates;
end;


function Tdm.buscaProximoParametro(p: String): Integer;
var i:Integer;
begin
   QAux.SQL.Text := 'select valor from parametros where parametro =:p';
   QAux.ParamByName('p').AsString := p;
   QAux.Open;
   if not QAux.IsEmpty then
   begin
      i:= StrToInt(QAux.Fields[0].asString);
      QAux.SQL.Text := 'update parametros set valor =:v where parametro =:p';
      QAux.ParamByName('v').AsString := IntToStr(i+1);
      QAux.ParamByName('p').AsString := p;
      QAux.ExecSQL;
      buscaProximoParametro := i;
   end
   else
   begin
     showMessage('Parametro inválido');
   end;
end;

procedure Tdm.MLivroAfterInsert(DataSet: TDataSet);
begin
  MLivroidLivro.AsInteger := buscaProximoParametro('seqLivro');
end;

procedure Tdm.MAutorAfterInsert(DataSet: TDataSet);
begin
  MAutoridAutor.AsInteger := buscaProximoParametro('seqAutor');
end;

procedure Tdm.MCategoriaAfterInsert(DataSet: TDataSet);
begin
  MCategoriacodCategoria.AsInteger := buscaProximoParametro('seqCategoria');
end;

procedure Tdm.MLivroAfterScroll(DataSet: TDataSet);
begin
   QAutLivroNovo.close;
   QAutLivroNovo.SQL.text := 'SELECT a.idAutor,a.nome FROM autorlivro al , autor a where al.idautor = a.idautor and al.idLivro = :parametro';
   QAutLivroNovo.ParamByName('parametro').asinteger := MLivroidLivro.AsInteger;
   QAutLivroNovo.Open;
end;

procedure Tdm.MLivroBeforeDelete(DataSet: TDataSet);
begin
   QAutLivroNovo.close;
   QAutLivroNovo.SQL.Add('DELETE FROM AutorLivro WHERE idLivro = :parametro');
   QAutLivroNovo.ParamByName('parametro').asinteger := MLivroidLivro.AsInteger;
   QAutLivroNovo.ExecSQL;
end;

procedure Tdm.MCategoriaBeforeDelete(DataSet: TDataSet);
begin
   QAutLivroNovo.close;
   QAutLivroNovo.SQL.Add('SELECT c.codCategoria FROM Livro l INNER JOIN Categoria c ON (l.idCategoria =:parametro)');
   QAutLivroNovo.ParamByName('parametro').asinteger := MCategoriacodCategoria.AsInteger;
   QAutLivroNovo.Open;

   if not QAutLivroNovo.IsEmpty then
   begin
      ShowMessage('Não foi possivel excluir o registro');
      Abort;
   end
   else
   begin
      ShowMessage('Registro excluido com sucesso');
   end;
end;

procedure Tdm.MAutorBeforeDelete(DataSet: TDataSet);
begin
   QAutLivroNovo.close;
   QAutLivroNovo.SQL.Add('SELECT a.idAutor FROM AutorLivro al INNER JOIN Autor a ON (al.idAutor =:parametro)');
   QAutLivroNovo.ParamByName('parametro').asinteger := MAutoridAutor.AsInteger;
   QAutLivroNovo.Open;

   if not QAutLivroNovo.IsEmpty then
   begin
      ShowMessage('Não foi possivel excluir o registro');
      Abort;
   end
   else
   begin
      ShowMessage('Registro excluido com sucesso');
   end;
end;

end.
