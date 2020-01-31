unit UPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,ComCtrls, ToolWin, Grids, DBGrids, StdCtrls, DBCtrls, DB,udao;

type
  TFPadrao = class(TForm)
    ToolBar1: TToolBar;
    btNovo: TToolButton;
    btDeletar: TToolButton;
    btAlterar: TToolButton;
    btCancelar: TToolButton;
    btPesquisar: TToolButton;
    btSalvar: TToolButton;
    btPrimeiro: TToolButton;
    btProx: TToolButton;
    btUltimo: TToolButton;
    btAnt: TToolButton;
    ds: TDataSource;
    PageControl1: TPageControl;
    tbDados: TTabSheet;
    tbFiltros: TTabSheet;
    grFiltros: TGroupBox;
    DBGrid1: TDBGrid;
    grDados: TGroupBox;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btDeletarClick(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure btPrimeiroClick(Sender: TObject);
    procedure btAntClick(Sender: TObject);
    procedure btProxClick(Sender: TObject);
    procedure btUltimoClick(Sender: TObject);
    
  private
    procedure StatusBotoes(e:Integer);
    { Private declarations }
  public
    { Public declarations }
    s: String;
  end;

var
  FPadrao: TFPadrao;

implementation
{$R *.dfm}

procedure TFPadrao.StatusBotoes(e: Integer);
begin
   btSalvar.Enabled := e=1;
   btCancelar.Enabled := e=1;

   btAnt.Enabled         :=  (e=2) and not (ds.DataSet.IsEmpty);
   btProx.Enabled        :=  (e=2) and not (ds.DataSet.IsEmpty);
   btPrimeiro.Enabled    :=  (e=2) and not (ds.DataSet.IsEmpty);
   btUltimo.Enabled      :=  (e=2) and not (ds.DataSet.IsEmpty);

   btNovo.Enabled    :=  e=2;
   btDeletar.Enabled := (e=2) and not (ds.DataSet.IsEmpty);
   btAlterar.Enabled := (e=2) and not (ds.DataSet.IsEmpty);
   btPesquisar.Enabled := e=2;
end;

procedure TFPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   ds.DataSet.Close;
end;

procedure TFPadrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (key = vk_return)
      and not (ActiveControl is TMemo )
      and not (ActiveControl is TdbMemo )
      and not (ActiveControl is TDBGrid ) then
      Perform(VK_NEXT,0,0);
end;

procedure TFPadrao.dsStateChange(Sender: TObject);
begin
   tbFiltros.TabVisible := ds.DataSet.State in [dsbrowse, dsinactive];
   grDados.Enabled      := ds.DataSet.State in dsEditModes;
   if ds.DataSet.State in dsEditModes then
      StatusBotoes(1)
   else
      StatusBotoes(2);
end;

procedure TFPadrao.FormShow(Sender: TObject);
begin
   StatusBotoes(2);
end;

procedure TFPadrao.btNovoClick(Sender: TObject);
begin
   if not ds.DataSet.Active then
     ds.DataSet.Open;
   ds.DataSet.Append;

   PageControl1.ActivePageIndex := 0;

end;

procedure TFPadrao.btAlterarClick(Sender: TObject);
begin
   if ds.DataSet.Active then
   begin
      if not ds.DataSet.IsEmpty then
        begin
          ds.DataSet.Edit;
          PageControl1.ActivePageIndex := 0;
        end
        else
          ShowMessage('Não há registros para alteração');
   end;
end;

procedure TFPadrao.btSalvarClick(Sender: TObject);
begin
   ds.DataSet.Post;
end;

procedure TFPadrao.btCancelarClick(Sender: TObject);
begin
    if Application.MessageBox('Deseja cancelar?','Cancelar',MB_YESNO+MB_ICONQUESTION)=id_yes then
    begin
      ds.DataSet.Cancel;
    end;
end;

procedure TFPadrao.btDeletarClick(Sender: TObject);
begin
   if ds.DataSet.Active then
   begin
      if not ds.DataSet.IsEmpty then
      begin
        if Application.MessageBox('Deseja deletar?','Deletar',MB_YESNO+MB_ICONQUESTION)=id_yes then
        begin
          ds.DataSet.Delete;
        end
      else
        ShowMessage('Não há registros');
      end;
   end;
end;

procedure TFPadrao.btPesquisarClick(Sender: TObject);
begin
   ds.DataSet.Close;
   ds.DataSet.Open;
end;

procedure TFPadrao.btPrimeiroClick(Sender: TObject);
begin
   ds.DataSet.First;
end;

procedure TFPadrao.btAntClick(Sender: TObject);
begin
   ds.DataSet.Prior;
end;

procedure TFPadrao.btProxClick(Sender: TObject);
begin
   ds.DataSet.Next;
end;

procedure TFPadrao.btUltimoClick(Sender: TObject);
begin
  ds.DataSet.Last;
end;

end.
