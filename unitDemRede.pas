unit unitDemRede;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList, Vcl.ImgList,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, frxClass, frxDBSet;

type
  TfrmDemRede = class(TForm)
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
    qryRede: TFDQuery;
    dsRede: TDataSource;
    qryRedenome: TStringField;
    qryRedenomePC: TStringField;
    qryRedeip: TStringField;
    qryRedemac: TStringField;
    rgFiltro: TRadioGroup;
    btnRelatorio: TButton;
    relRede: TfrxReport;
    relDsRede: TfrxDBDataset;
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
  frmDemRede: TfrmDemRede;

implementation

{$R *.dfm}

uses unitCadFuncionarios, unitDemAgenda, unitDemTerminalService, unitDM,
  unitPrincipal;

procedure TfrmDemRede.btnAnteriorClick(Sender: TObject);
begin
  qryRede.Prior;
end;

procedure TfrmDemRede.btnPrimeiroClick(Sender: TObject);
begin
  qryRede.First;
end;

procedure TfrmDemRede.btnProximoClick(Sender: TObject);
begin
  qryRede.Next;
end;

procedure TfrmDemRede.btnRelatorioClick(Sender: TObject);
begin
    relRede.LoadFromFile('D:\Curso_Delphi\Pratic\Win32\Debug\rel\relRede.fr3');
    relRede.ShowReport();
end;

procedure TfrmDemRede.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDemRede.btnUltimoClick(Sender: TObject);
begin
  qryRede.Last;
end;

procedure TfrmDemRede.editPesquisarChange(Sender: TObject);
begin

  if rgFiltro.ItemIndex = 0 then
    Begin
      qryRede.Close;
      qryRede.SQL.Clear;
      qryRede.SQL.Add('SELECT * FROM tbFuncionarios WHERE nome like :nome');
      qryRede.ParamByName('nome').AsString := editPesquisar.Text+'%';
      qryRede.Open;
    End;

  if rgFiltro.ItemIndex = 1 then
    Begin
      qryRede.Close;
      qryRede.SQL.Clear;
      qryRede.SQL.Add('SELECT * FROM tbFuncionarios WHERE nomePC like :nomePC');
      qryRede.ParamByName('nomePC').AsString := editPesquisar.Text+'%';
      qryRede.Open;
    End;

  if rgFiltro.ItemIndex = 2 then
    Begin
      qryRede.Close;
      qryRede.SQL.Clear;
      qryRede.SQL.Add('SELECT * FROM tbFuncionarios WHERE ip like :ip');
      qryRede.ParamByName('ip').AsString := editPesquisar.Text+'%';
      qryRede.Open;
    End;

  if rgFiltro.ItemIndex = 3 then
    Begin
      qryRede.Close;
      qryRede.SQL.Clear;
      qryRede.SQL.Add('SELECT * FROM tbFuncionarios WHERE mac like :mac');
      qryRede.ParamByName('mac').AsString := editPesquisar.Text+'%';
      qryRede.Open;
    End;
end;

procedure TfrmDemRede.gridAgendaTitleClick(Column: TColumn);
begin
  qryRede.IndexFieldNames := Column.FieldName;
end;

end.
