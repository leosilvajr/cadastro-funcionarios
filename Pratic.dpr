program Pratic;

uses
  Vcl.Forms,
  unitPrincipal in 'unitPrincipal.pas' {frmPrincipal},
  unitCadFuncionarios in 'unitCadFuncionarios.pas' {frmCadFuncionario},
  unitDM in 'unitDM.pas' {DM: TDataModule},
  unitDemAgenda in 'unitDemAgenda.pas' {frmDemAgenda},
  unitDemTerminalService in 'unitDemTerminalService.pas' {frmDemTerminalService},
  unitDemRede in 'unitDemRede.pas' {frmDemRede},
  unitDemSetup in 'unitDemSetup.pas' {frmSetup};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmDemAgenda, frmDemAgenda);
  Application.CreateForm(TfrmDemTerminalService, frmDemTerminalService);
  Application.CreateForm(TfrmDemRede, frmDemRede);
  Application.CreateForm(TfrmSetup, frmSetup);
  Application.Run;
end.
