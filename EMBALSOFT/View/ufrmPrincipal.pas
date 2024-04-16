unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, uClienteController,
  uClienteModel, uDmPrincipal;

type
  TOperacao = (opNovo, opAlterar, opNavegar);


  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    edNomeReduzido: TEdit;
    edRazaoSocial: TEdit;
    edCNPJ: TEdit;
    edDtNascimento: TEdit;
    Panel2: TPanel;
    Pnl: TPanel;
    btSair: TButton;
    btPesquisar: TButton;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    btCancelar: TButton;
    DBGrid2: TDBGrid;
    edPesquisar: TEdit;
    Label4: TLabel;
    dsPesquisar: TDataSource;
    Panel6: TPanel;
    Label2: TLabel;
    edNomeContato: TEdit;
    edtCodigo: TEdit;
    Label8: TLabel;
    Label6: TLabel;
    edCPF: TEdit;
    edDtCadastro: TEdit;
    Label9: TLabel;
    btNovo: TButton;
    btGravar: TButton;
    btAlterar: TButton;
    btExcluir: TButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FOperacao: TOperacao;
  public
    procedure Novo;
    procedure Detalhar;
    procedure Configuracoes;
    procedure Pesquisar;
    procedure CarregarCliente;
   // procedure Listar;
    Procedure Alterar;
    procedure Excluir;
    procedure Inserir;
    procedure Gravar;
    procedure HabilitarControles(aOperacao: TOperacao);

  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.Alterar;
var
  Ocliente: TCliente;
  OclienteController: TClienteConroller;
  sErro: String;
begin
  oCliente := TCliente.create;
  OclienteController := TClienteConroller.create;
  try
    with Ocliente do
    begin
      IdCliente := StrToIntDef(edtCodigo.Text, 0);
      NomeReduzido := edNomeReduzido.Text;
      RazaoSocial := edRazaoSocial.Text;
      CPF := edCPF.Text;
      CNPJ := edCNPJ.Text;
      DtNascimento := StrToDateTime(edDtNascimento.Text);
      DtCadastro := StrToDateTime(edDtCadastro.Text);
    end;

    if OclienteController.Alterar(Ocliente, sErro) = false then
      raise Exception.Create(sErro)
    else
      ShowMessage('cadastro ok');

  finally
    FreeAndNil(Ocliente);
    FreeAndNil(OclienteController);
  end;


end;

procedure TfrmPrincipal.btAlterarClick(Sender: TObject);
begin
Alterar;
end;

procedure TfrmPrincipal.btCancelarClick(Sender: TObject);
begin
  HabilitarControles(opNavegar);
end;

procedure TfrmPrincipal.btExcluirClick(Sender: TObject);
begin
  Excluir;
end;

procedure TfrmPrincipal.btNovoClick(Sender: TObject);
begin
  Novo;
  HabilitarControles(opNavegar);
end;

procedure TfrmPrincipal.btPesquisarClick(Sender: TObject);
begin
  Pesquisar;
   CarregarCliente;
end;

procedure TfrmPrincipal.btSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.btGravarClick(Sender: TObject);
begin
  Gravar;
  HabilitarControles(opNavegar);
end;

procedure TfrmPrincipal.CarregarCliente;
var
  oCliente: TCliente;
  oClienteController: TClienteConroller;
begin
  oCliente := TCliente.create;
  oClienteController := TClienteConroller.create;
  try
    oClienteController.CarregarCliente(oCliente, dsPesquisar.DataSet.FieldByName('IdCliente').AsInteger );
    with oCliente do
    begin
      edtCodigo.Text := IntToStr(IdCliente);
      edNomeReduzido.Text := NomeReduzido;
      edRazaoSocial.Text := RazaoSocial;
      edCPF.Text := CPF;
      edCNPJ.Text := CNPJ;
      edDtNascimento.Text := DateToStr(DtNascimento);
      edDtCadastro.Text := DateToStr(DtCadastro);

    end;
  finally
    FreeAndNil(oCliente);
    FreeAndNil(oClienteController);
  end;

end;

procedure TfrmPrincipal.Configuracoes;
begin

  dmPrincipal.qGrid.Active:=true;
end;

procedure TfrmPrincipal.Detalhar;
begin
 // FOperacao := opNavegar;
end;

procedure TfrmPrincipal.Excluir;
var
  oClienteController: TClienteConroller;
  sErro: string;
begin
  oClienteController := TClienteConroller.create;
  try
    if (dmPrincipal.cdsPesquisar.Active) and (dmPrincipal.cdsPesquisar.RecordCount > 0) then
    begin
      if MessageDlg('Deseja excluir?', mtConfirmation, [mbYes, mbno], 0) = IDYES then
      begin
        if oClienteController.Exlcuir(dmPrincipal.cdsPesquisarIdCliente.AsInteger, sErro) = false then
          raise Exception.Create(sErro);
        oClienteController.Pesquisar(edPesquisar.Text);
      end;
    end
    else
    raise Exception.Create('Não ha registros para excluir');
  finally
    FreeAndNil(oClienteController);
  end;

end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  dmPrincipal := TdmPrincipal.Create(nil);
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  FreeAndNil(dmPrincipal);
end;

procedure TfrmPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  Configuracoes;
end;

procedure TfrmPrincipal.Gravar;
var
  oClienteController: TClienteConroller;
begin
  oClienteController := TClienteConroller.create;
  try
    case FOperacao of
      opNovo: Inserir;
      opAlterar: Alterar;
    end;
    oClienteController.Pesquisar(edPesquisar.Text);
  finally
    FreeAndNil(oClienteController);
  end;

end;

procedure TfrmPrincipal.HabilitarControles(aOperacao: TOperacao);
begin
 case aOperacao of
    opNovo,opAlterar:
    begin

      btSair.Enabled := False;
      btAlterar.Enabled := False;
      btNovo.Enabled := True;
      btCancelar.Enabled := True;
      btGravar.Enabled:= False;

    end;
    opNavegar:
    begin
      btGravar.Enabled:= True;
      btSair.Enabled := True;
      btAlterar.Enabled := True;
      btNovo.Enabled := False;
      btCancelar.Enabled := False;
    end;
  end;
end;

procedure TfrmPrincipal.Inserir;
var
  oCliente: TCliente;
  oClienteController: TClienteConroller;
  sErro: string;
begin
  oCliente := TCliente.create;
  oClienteController := TClienteConroller.Create;
  try
    with oCliente do
    begin
      IdCliente := 0;
      NomeReduzido := edNomeReduzido.Text;
      RazaoSocial := edRazaoSocial.Text;
      CPF := edCPF.Text;
      CNPJ := edCNPJ.Text;
      DtNascimento := StrToDate(edDtNascimento.Text);

    end;
    if oClienteController.Inserir(oCliente, sErro) = false then
      raise Exception.Create(sErro);
  finally
    FreeAndNil(oCliente);
    FreeAndNil(oClienteController);
  end;

end;

procedure TfrmPrincipal.Novo;
begin
    FOperacao := opNovo;
end;

procedure TfrmPrincipal.Pesquisar;
var
  oClienteController: TClienteConroller;
begin
  oClienteController := TClienteConroller.create;
  try
    oClienteController.Pesquisar(edPesquisar.Text);
  finally
    FreeAndNil(oClienteController);
  end;

end;

end.
