unit unitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, System.ImageList, Vcl.ImgList;

type
  TfrmPrincipal = class(TForm)
    timer: TTimer;
    statusBar: TStatusBar;
    pnlTopo: TPanel;
    Button1: TButton;
    imageList: TImageList;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Image1: TImage;
    procedure btnMainSairClick(Sender: TObject);
    procedure Sai1Click(Sender: TObject);
    procedure btnMainClientesClick(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure timerTimer(Sender: TObject);
    procedure btnMainProdutosClick(Sender: TObject);
    procedure Agenda1Click(Sender: TObject);
    procedure AcessosTerminalService1Click(Sender: TObject);
    procedure InformaessobreRede1Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure InformaesTcnicas1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses unitCadFuncionarios, unitConsultaFuncionario, unitDM, unitDemAgenda,
  unitDemTerminalService, unitDemRede, unitDemSetup;

procedure TfrmPrincipal.AcessosTerminalService1Click(Sender: TObject);
begin
  frmDemTerminalService := TfrmDemTerminalService.Create(nil);
  try
    frmDemTerminalService.ShowModal;
  finally
    FreeAndNil(frmDemTerminalService);
  end;
end;

procedure TfrmPrincipal.Agenda1Click(Sender: TObject);
begin
  frmDemAgenda := TfrmDemAgenda.Create(nil);
  try
    frmDemAgenda.ShowModal;
  finally
    FreeAndNil(frmDemAgenda);
  end;
end;

procedure TfrmPrincipal.btnMainClientesClick(Sender: TObject);
begin
  frmCadFuncionario := TfrmCadFuncionario.Create(nil);
  try
    frmCadFuncionario.ShowModal;
  finally
    FreeAndNil(frmCadFuncionario);
  end;
end;

procedure TfrmPrincipal.btnMainProdutosClick(Sender: TObject);
begin
  frmConsultaFuncionario := TfrmConsultaFuncionario.Create(nil);
  try
    frmConsultaFuncionario.ShowModal;
  finally
    FreeAndNil(frmConsultaFuncionario);
  end;
end;

procedure TfrmPrincipal.btnMainSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
begin
  frmSetup := TfrmSetup.Create(nil);
  try
    frmSetup.ShowModal;
  finally
    FreeAndNil(frmSetup);
  end;
end;

procedure TfrmPrincipal.Button3Click(Sender: TObject);
begin
  frmDemTerminalService := TfrmDemTerminalService.Create(nil);
  try
    frmDemTerminalService.ShowModal;
  finally
    FreeAndNil(frmDemTerminalService);
  end;
end;

procedure TfrmPrincipal.Button4Click(Sender: TObject);
begin
    frmDemRede := TfrmDemRede.Create(nil);
  try
    frmDemRede.ShowModal;
  finally
    FreeAndNil(frmDemRede);
  end;
end;

procedure TfrmPrincipal.Button5Click(Sender: TObject);
begin
  frmDemAgenda := TfrmDemAgenda.Create(nil);
  try
    frmDemAgenda.ShowModal;
  finally
    FreeAndNil(frmDemAgenda);
  end;
end;

procedure TfrmPrincipal.Button6Click(Sender: TObject);
begin
    frmCadFuncionario := TfrmCadFuncionario.Create(nil);
  try
    frmCadFuncionario.ShowModal;
  finally
    FreeAndNil(frmCadFuncionario);
  end;
end;

procedure TfrmPrincipal.Clientes1Click(Sender: TObject);
begin
    frmCadFuncionario := TfrmCadFuncionario.Create(nil);
  try
    frmCadFuncionario.ShowModal;
  finally
    FreeAndNil(frmCadFuncionario);
  end;
end;

procedure TfrmPrincipal.InformaessobreRede1Click(Sender: TObject);
begin
    frmDemRede := TfrmDemRede.Create(nil);
  try
    frmDemRede.ShowModal;
  finally
    FreeAndNil(frmDemRede);
  end;
end;

procedure TfrmPrincipal.InformaesTcnicas1Click(Sender: TObject);
begin
  frmSetup := TfrmSetup.Create(nil);
  try
    frmSetup.ShowModal;
  finally
    FreeAndNil(frmSetup);
  end;
end;

procedure TfrmPrincipal.Sai1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.timerTimer(Sender: TObject);
begin
  statusBar.Panels.Items[0].Text :=TimeToStr(now);
  statusBar.Panels.Items[1].Text :=DateToStr(now);
  statusBar.PanelS.Items[2].Text := 'QUADRO DE FUNCIONARIOS';
end;

end.
