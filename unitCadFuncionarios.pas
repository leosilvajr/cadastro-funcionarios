unit unitCadFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.DBCtrls, Vcl.Mask,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmCadFuncionario = class(TForm)
    pnlBotoes: TPanel;
    btnCancelar: TButton;
    btnDeletar: TButton;
    btnIncluir: TButton;
    btnSalvar: TButton;
    btnSair: TButton;
    btnEdit: TButton;
    pnlNavigator: TPanel;
    btnPrimeiro: TButton;
    btnAnterior: TButton;
    btnProximo: TButton;
    btnUltimo: TButton;
    imageCadastro: TImageList;
    Label1: TLabel;
    lblNome: TLabel;
    editNome: TDBEdit;
    lblNascimento: TLabel;
    editNascimento: TDBEdit;
    lblFuncao: TLabel;
    lblCelPessoal: TLabel;
    editCelPessoal: TDBEdit;
    lblCelTrabalho: TLabel;
    editCelPro: TDBEdit;
    lblRamal: TLabel;
    editRamal: TDBEdit;
    lblNomePC: TLabel;
    editPcName: TDBEdit;
    lblLinkts: TLabel;
    editLinkTs: TDBEdit;
    lblIp: TLabel;
    editIp: TDBEdit;
    lblMac: TLabel;
    editMac: TDBEdit;
    lblProcessador: TLabel;
    editProcessador: TDBEdit;
    lblMemoria: TLabel;
    editMemoria: TDBEdit;
    lblSsdHd: TLabel;
    editHdSSD: TDBEdit;
    lblID: TDBText;
    dbFuncao: TDBComboBox;
    lblGB: TLabel;
    qFuncionarios: TFDQuery;
    qAuxiliar: TFDQuery;
    dsFuncionario: TDataSource;
    qFuncionariosid: TFDAutoIncField;
    qFuncionariosnome: TStringField;
    qFuncionariosnascimento: TStringField;
    qFuncionariosfuncao: TStringField;
    qFuncionarioscelularPessoal: TStringField;
    qFuncionarioscelularTrabalho: TStringField;
    qFuncionariosramal: TIntegerField;
    qFuncionariosnomePC: TStringField;
    qFuncionarioslinkTs: TStringField;
    qFuncionariosip: TStringField;
    qFuncionariosmac: TStringField;
    qFuncionariosprocessador: TStringField;
    qFuncionariosmemoria: TIntegerField;
    qFuncionarioshd_ssd: TStringField;
    lblEmail: TLabel;
    editEmail: TDBEdit;
    qFuncionariosemail: TStringField;
    qFuncionariosuserTs: TStringField;
    qFuncionariossenhaTs: TStringField;
    lblUserTs: TLabel;
    editUserTs: TDBEdit;
    lblSenhaTs: TLabel;
    editSenhaTs: TDBEdit;
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure editNomeKeyPress(Sender: TObject; var Key: Char);
    procedure btnProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFuncionario: TfrmCadFuncionario;

implementation

{$R *.dfm}

uses unitPrincipal, unitDM, unitConsultaFuncionario;

procedure TfrmCadFuncionario.btnAnteriorClick(Sender: TObject);
begin
qFuncionarios.Prior;
end;

procedure TfrmCadFuncionario.btnCancelarClick(Sender: TObject);
begin
  editNome.ReadOnly := True;
  editNascimento.ReadOnly := True;
  dbFuncao.ReadOnly := True;
  editRamal.ReadOnly := True;
  editEmail.ReadOnly := True;
  editLinkTs.ReadOnly := True;
  editUserTs.ReadOnly := True;
  editSenhaTs.ReadOnly := True;
  editCelPessoal.ReadOnly := True;
  editCelPro.ReadOnly := True;
  editPcName.ReadOnly := True;
  editIp.ReadOnly := True;
  editMac.ReadOnly := True;
  editProcessador.ReadOnly := True;
  editMemoria.ReadOnly := True;
  editHdSSD.ReadOnly := True;

  btnIncluir.Enabled :=true;
  btnDeletar.Enabled :=true;
  btnIncluir.Enabled :=true;
  btnDeletar.Enabled :=true;

  btnSalvar.Enabled := false;
  btnCancelar.Enabled := false;

  btnEdit.Enabled :=true;

  qFuncionarios.Cancel;
end;

procedure TfrmCadFuncionario.btnDeletarClick(Sender: TObject);
begin
    if Application.MessageBox('Deseja deletar o Registro','Atenção',MB_ICONQUESTION+MB_YESNO) =mrYes then
    BEGIN
      qFuncionarios.Delete;
    END;
end;

procedure TfrmCadFuncionario.btnEditClick(Sender: TObject);
begin

  editNome.ReadOnly := false;
  editNascimento.ReadOnly := false;
  dbFuncao.ReadOnly := false;
  editRamal.ReadOnly := false;
  editEmail.ReadOnly := false;
  editLinkTs.ReadOnly := false;
  editUserTs.ReadOnly := false;
  editSenhaTs.ReadOnly := false;
  editCelPessoal.ReadOnly := false;
  editCelPro.ReadOnly := false;
  editPcName.ReadOnly := false;
  editIp.ReadOnly := false;
  editMac.ReadOnly := false;
  editProcessador.ReadOnly := false;
  editMemoria.ReadOnly := false;
  editHdSSD.ReadOnly := false;


  btnIncluir.Enabled := false;
  btnDeletar.Enabled := false;
  btnEdit.Enabled := false;

  btnSalvar.Enabled := true;
  btnCancelar.Enabled := true;

  qFuncionarios.Edit;
end;

procedure TfrmCadFuncionario.btnIncluirClick(Sender: TObject);
begin
  editNome.ReadOnly := false;
  editNascimento.ReadOnly := false;
  dbFuncao.ReadOnly := false;
  editRamal.ReadOnly := false;
  editEmail.ReadOnly := false;
  editLinkTs.ReadOnly := false;
  editUserTs.ReadOnly := false;
  editSenhaTs.ReadOnly := false;
  editCelPessoal.ReadOnly := false;
  editCelPro.ReadOnly := false;
  editPcName.ReadOnly := false;
  editIp.ReadOnly := false;
  editMac.ReadOnly := false;
  editProcessador.ReadOnly := false;
  editMemoria.ReadOnly := false;
  editHdSSD.ReadOnly := false;

  btnIncluir.Enabled := false;
  btnDeletar.Enabled := false;

  btnSalvar.Enabled := true;
  btnCancelar.Enabled := true;

  btnEdit.Enabled :=false;

  qFuncionarios.Append;

  qAuxiliar.SQL.Text := 'select STR(IDENT_CURRENT(''tbFuncionarios'') + 1) as id';
  qAuxiliar.Open;
  lblID.Caption := qAuxiliar.FieldByName('id').Value;
end;

procedure TfrmCadFuncionario.btnPrimeiroClick(Sender: TObject);
begin
  qFuncionarios.First;
end;

procedure TfrmCadFuncionario.btnProcurarClick(Sender: TObject);
begin
  frmConsultaFuncionario := TfrmConsultaFuncionario.Create(nil);
  try
    frmConsultaFuncionario.ShowModal;
  finally
    FreeAndNil(frmConsultaFuncionario);
  end;
end;

procedure TfrmCadFuncionario.btnProximoClick(Sender: TObject);
begin
  qFuncionarios.Next;
end;

procedure TfrmCadFuncionario.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadFuncionario.btnSalvarClick(Sender: TObject);
begin
  editNome.ReadOnly := True;
  editNascimento.ReadOnly := True;
  dbFuncao.ReadOnly := True;
  editRamal.ReadOnly := True;
  editEmail.ReadOnly := True;
  editLinkTs.ReadOnly := True;
  editUserTs.ReadOnly := True;
  editSenhaTs.ReadOnly := True;
  editCelPessoal.ReadOnly := True;
  editCelPro.ReadOnly := True;
  editPcName.ReadOnly := True;
  editIp.ReadOnly := True;
  editMac.ReadOnly := True;
  editProcessador.ReadOnly := True;
  editMemoria.ReadOnly := True;
  editHdSSD.ReadOnly := True;
  btnIncluir.Enabled :=true;
  btnDeletar.Enabled :=true;

  btnSalvar.Enabled := false;
  btnCancelar.Enabled := false;

  btnEdit.Enabled :=true;

  qFuncionarios.Post;
end;

procedure TfrmCadFuncionario.btnUltimoClick(Sender: TObject);
begin
  qFuncionarios.Last;
end;

procedure TfrmCadFuncionario.editNomeKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
    begin
      //desabilitar o processamento posterior da tecla
      key := #0;
      //simulação do tab
      Perform(WM_NEXTDLGCTL,0,0)
    end;
end;

procedure TfrmCadFuncionario.FormCreate(Sender: TObject);
begin
  btnSalvar.Enabled := false;
  btnCancelar.Enabled := false;

  editNome.ReadOnly := True;
  editNascimento.ReadOnly := True;
  dbFuncao.ReadOnly := True;
  editRamal.ReadOnly := True;
  editEmail.ReadOnly := True;
  editLinkTs.ReadOnly := True;
  editUserTs.ReadOnly := True;
  editSenhaTs.ReadOnly := True;
  editCelPessoal.ReadOnly := True;
  editCelPro.ReadOnly := True;
  editPcName.ReadOnly := True;
  editIp.ReadOnly := True;
  editMac.ReadOnly := True;
  editProcessador.ReadOnly := True;
  editMemoria.ReadOnly := True;
  editHdSSD.ReadOnly := True;
end;

end.
