unit unitDemAgenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, System.ImageList, Vcl.ImgList,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass, frxDBSet;

type
  TfrmDemAgenda = class(TForm)
    pnlTopo: TPanel;
    Label1: TLabel;
    editPesquisar: TEdit;
    gridAgenda: TDBGrid;
    pnlNavigator: TPanel;
    btnPrimeiro: TButton;
    btnAnterior: TButton;
    btnProximo: TButton;
    btnUltimo: TButton;
    imageAgenda: TImageList;
    qryAgenda: TFDQuery;
    dsAgenda: TDataSource;
    qryAgendanome: TStringField;
    qryAgendaramal: TIntegerField;
    qryAgendacelularPessoal: TStringField;
    qryAgendacelularTrabalho: TStringField;
    rgFiltro: TRadioGroup;
    btnRelatorio: TButton;
    relAgenda: TfrxReport;
    relDsAgenda: TfrxDBDataset;
    procedure btnSairClick(Sender: TObject);
    procedure gridAgendaTitleClick(Column: TColumn);
    procedure editPesquisarChange(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDemAgenda: TfrmDemAgenda;

implementation

{$R *.dfm}

uses unitCadFuncionarios, unitDM, unitPrincipal;

procedure TfrmDemAgenda.btnAnteriorClick(Sender: TObject);
begin
  qryAgenda.prior;
end;

procedure TfrmDemAgenda.btnPrimeiroClick(Sender: TObject);
begin
  qryAgenda.First;
end;

procedure TfrmDemAgenda.btnProximoClick(Sender: TObject);
begin
  qryAgenda.Next;
end;

procedure TfrmDemAgenda.btnRelatorioClick(Sender: TObject);
begin
  relAgenda.LoadFromFile('D:\Curso_Delphi\Pratic\Win32\Debug\rel\relAgenda.fr3');
  relAgenda.ShowReport();
end;

procedure TfrmDemAgenda.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDemAgenda.btnUltimoClick(Sender: TObject);
begin
  qryAgenda.last;
end;

procedure TfrmDemAgenda.editPesquisarChange(Sender: TObject);
begin
    if rgFiltro.ItemIndex = 0 then
    Begin
      qryAgenda.Close;
      qryAgenda.SQL.Clear;
      qryAgenda.SQL.Add('SELECT * FROM tbFuncionarios WHERE nome like :nome');
      qryAgenda.ParamByName('nome').AsString := editPesquisar.Text+'%';
      qryAgenda.Open;
    End;

  if rgFiltro.ItemIndex = 1 then
    Begin
      qryAgenda.Close;
      qryAgenda.SQL.Clear;
      qryAgenda.SQL.Add('SELECT * FROM tbFuncionarios WHERE ramal like :ramal');
      qryAgenda.ParamByName('ramal').AsString := editPesquisar.Text+'%';
      qryAgenda.Open;
    End;

  if rgFiltro.ItemIndex = 2 then
    Begin
      qryAgenda.Close;
      qryAgenda.SQL.Clear;
      qryAgenda.SQL.Add('SELECT * FROM tbFuncionarios WHERE celularPessoal like :celularPessoal');
      qryAgenda.ParamByName('celularPessoal').AsString := editPesquisar.Text+'%';
      qryAgenda.Open;
    End;

  if rgFiltro.ItemIndex = 3 then
    Begin
      qryAgenda.Close;
      qryAgenda.SQL.Clear;
      qryAgenda.SQL.Add('SELECT * FROM tbFuncionarios WHERE celularTrabalho like :celularTrabalho');
      qryAgenda.ParamByName('celularTrabalho').AsString := editPesquisar.Text+'%';
      qryAgenda.Open;
    End;
end;

procedure TfrmDemAgenda.gridAgendaTitleClick(Column: TColumn);
begin
  qryAgenda.IndexFieldNames := Column.FieldName;
end;

end.
