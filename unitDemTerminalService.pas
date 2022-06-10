unit unitDemTerminalService;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList, Vcl.ImgList,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, frxClass, frxDBSet;

type
  TfrmDemTerminalService = class(TForm)
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
    qryTerminalService: TFDQuery;
    dsTerminalService: TDataSource;
    qryTerminalServicenome: TStringField;
    qryTerminalServicelinkTs: TStringField;
    qryTerminalServiceuserTs: TStringField;
    qryTerminalServicesenhaTs: TStringField;
    relTerminalService: TfrxReport;
    relDsTerminalService: TfrxDBDataset;
    btnRelatorio: TButton;
    rgFiltro: TRadioGroup;
    procedure btnSairClick(Sender: TObject);
    procedure gridAgendaTitleClick(Column: TColumn);
    procedure btnRelatorioClick(Sender: TObject);
    procedure editPesquisarChange(Sender: TObject);
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
  frmDemTerminalService: TfrmDemTerminalService;

implementation

{$R *.dfm}

uses unitCadFuncionarios, unitDemAgenda, unitDM, unitPrincipal;

procedure TfrmDemTerminalService.btnAnteriorClick(Sender: TObject);
begin
  qryTerminalService.Prior;
end;

procedure TfrmDemTerminalService.btnPrimeiroClick(Sender: TObject);
begin
  qryTerminalService.First;
end;

procedure TfrmDemTerminalService.btnProximoClick(Sender: TObject);
begin
  qryTerminalService.Next;
end;

procedure TfrmDemTerminalService.btnRelatorioClick(Sender: TObject);
var
caminho : String;

begin
  caminho := 'D:\Curso_Delphi\Pratic\Win32\Debug\rel\relTerminalService.fr3';
  relTerminalService.LoadFromFile(caminho);
  relTerminalService.ShowReport();
end;

procedure TfrmDemTerminalService.btnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmDemTerminalService.btnUltimoClick(Sender: TObject);
begin
  qryTerminalService.Last;
end;

procedure TfrmDemTerminalService.editPesquisarChange(Sender: TObject);
begin
      if rgFiltro.ItemIndex = 0 then
        begin
          qryTerminalService.Close;
          qryTerminalService.SQL.Clear;

          qryTerminalService.SQL.Add('SELECT * FROM tbFuncionarios WHERE nome LIKE :nome');
          qryTerminalService.ParamByName('nome').AsString := editPesquisar.Text +'%';
          qryTerminalService.Open;
        end;

      if rgFiltro.ItemIndex = 1 then
        begin
          qryTerminalService.Close;
          qryTerminalService.SQL.Clear;

          qryTerminalService.SQL.Add('SELECT * FROM tbFuncionarios WHERE linkTs LIKE :linkTs');
          qryTerminalService.ParamByName('linkTs').AsString := editPesquisar.Text+'%';
          qryTerminalService.Open;
        end;

      if rgFiltro.ItemIndex = 2 then
        begin
          qryTerminalService.Close;
          qryTerminalService.SQL.Clear;

          qryTerminalService.SQL.Add('SELECT * FROM tbFuncionarios WHERE userTs LIKE :userTs');
          qryTerminalService.ParamByName('userTs').AsString := editPesquisar.Text+'%';
          qryTerminalService.Open;
        end;

      if rgFiltro.ItemIndex = 3 then
        begin
          qryTerminalService.Close;
          qryTerminalService.SQL.Clear;

          qryTerminalService.SQL.Add('SELECT * FROM tbFuncionarios WHERE senhaTs LIKE :senhaTs');
          qryTerminalService.ParamByName('senhaTs').AsString := editPesquisar.Text+'%';
          qryTerminalService.Open;
        end;
end;

procedure TfrmDemTerminalService.gridAgendaTitleClick(Column: TColumn);
begin
  qryTerminalService.IndexFieldNames := Column.FieldName;
end;

end.
