unit unitConsultaFuncionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, System.ImageList, Vcl.ImgList,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmConsultaFuncionario = class(TForm)
    pnlTopo: TPanel;
    Label1: TLabel;
    btnSair: TButton;
    editPesquisar: TEdit;
    btnProcurar: TButton;
    gridFuncionario: TDBGrid;
    pnlNavigator: TPanel;
    btnPrimeiro: TButton;
    btnAnterior: TButton;
    btnProximo: TButton;
    btnUltimo: TButton;
    imageProduto: TImageList;
    qryConsulta: TFDQuery;
    dsConsulta: TDataSource;
    qryConsultanome: TStringField;
    qryConsultanascimento: TStringField;
    qryConsultafuncao: TStringField;
    qryConsultacelularPessoal: TStringField;
    qryConsultacelularTrabalho: TStringField;
    qryConsultaramal: TIntegerField;
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaFuncionario: TfrmConsultaFuncionario;

implementation

{$R *.dfm}

uses unitCadFuncionarios, unitDM, unitPrincipal;

procedure TfrmConsultaFuncionario.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.
