program embalsoft;

uses
  Vcl.Forms,
  ufrmPrincipal in 'View\ufrmPrincipal.pas' {frmPrincipal},
  uDmConexao in 'DAO\uDmConexao.pas' {dmConexao: TDataModule},
  uDmPrincipal in 'DAO\uDmPrincipal.pas' {dmPrincipal: TDataModule},
  uClienteModel in 'Model\uClienteModel.pas',
  uClienteController in 'Controller\uClienteController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.Run;
end.
