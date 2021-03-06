unit unitDemSetup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList, Vcl.ImgList,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, frxClass, frxDBSet;

type
  TfrmSetup = class(TForm)
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
    qrySetup: TFDQuery;
    dsSetup: TDataSource;
    qrySetupnome: TStringField;
    qrySetupnomePC: TStringField;
    qrySetupprocessador: TStringField;
    qrySetupmemoria: TIntegerField;
    qrySetuphd_ssd: TStringField;
    rgFiltro: TRadioGroup;
    relSetup: TfrxReport;
    relDsSetup: TfrxDBDataset;
    btnRelatorio: TButton;
    procedure btnSairClick(Sender: TObject);
    procedure gridAgendaTitleClick(Column: TColumn);
    procedure editPesquisarChange(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetup: TfrmSetup;

implementation

{$R *.dfm}

uses unitCadFuncionarios, unitDemAgenda, unitDemRede, unitDemTerminalService,
  unitDM, unitPrincipal;

procedure TfrmSetup.btnAnteriorClick(Sender: TObject);
begin
  qrySetup.Prior;
end;

procedure TfrmSetup.btnPrimeiroClick(Sender: TObject);
begin
  qrySetup.First;
end;

procedure TfrmSetup.btnProximoClick(Sender: TObject);
begin
  qrySetup.Next;
end;

procedure TfrmSetup.btnRelatorioClick(Sender: TObject);
begin
  relSetup.LoadFromFile('D:\Curso_Delphi\Pratic\Win32\Debug\rel\relSetup.fr3');
  relSetup.ShowReport();
end;

procedure TfrmSetup.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSetup.btnUltimoClick(Sender: TObject);
begin
  qrySetup.Last;
end;

procedure TfrmSetup.editPesquisarChange(Sender: TObject);
begin

  if rgFiltro.ItemIndex = 0 then
    Begin
      qrySetup.Close;
      qrySetup.SQL.Clear;
      qrySetup.SQL.Add('SELECT * FROM tbFuncionarios WHERE nome like :nome');
      qrySetup.ParamByName('nome').AsString := editPesquisar.Text+'%';
      qrySetup.Open;
    End;

  if rgFiltro.ItemIndex = 1 then
    Begin
      qrySetup.Close;
      qrySetup.SQL.Clear;
      qrySetup.SQL.Add('SELECT * FROM tbFuncionarios WHERE nomePC like :nomePC');
      qrySetup.ParamByName('nomePC').AsString := editPesquisar.Text+'%';
      qrySetup.Open;
    End;

  if rgFiltro.ItemIndex = 2 then
    Begin
      qrySetup.Close;
      qrySetup.SQL.Clear;
      qrySetup.SQL.Add('SELECT * FROM tbFuncionarios WHERE processador like :processador');
      qrySetup.ParamByName('processador').AsString := editPesquisar.Text+'%';
      qrySetup.Open;
    End;

  if rgFiltro.ItemIndex = 3 then
    Begin
      qrySetup.Close;
      qrySetup.SQL.Clear;
      qrySetup.SQL.Add('SELECT * FROM tbFuncionarios WHERE memoria like :memoria');
      qrySetup.ParamByName('memoria').AsString := editPesquisar.Text+'%';
      qrySetup.Open;
    End;

  if rgFiltro.ItemIndex = 4 then
    Begin
      qrySetup.close;
      qrySetup.SQL.Clear;
      qrySetup.SQL.Add('SELECT * FROM tbFuncionarios WHERE hd_ssd LIKE :hd_ssd');
      qrySetup.ParamByName('hd_ssd').AsString := editPesquisar.Text+'%';
      qrySetup.Open;
    End;


end;

procedure TfrmSetup.gridAgendaTitleClick(Column: TColumn);
begin
  qrySetup.IndexFieldNames := Column.FieldName;
end;

end.
