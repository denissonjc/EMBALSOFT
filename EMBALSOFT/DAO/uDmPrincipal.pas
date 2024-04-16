unit uDmPrincipal;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, Data.SqlExpr, uDmConexao, uClienteModel;

type
  TdmPrincipal = class(TDataModule)
    dspPesquisar: TDataSetProvider;
    cdsPesquisar: TClientDataSet;
    qPesquisar: TFDQuery;
    qInserir: TFDQuery;
    qAlterar: TFDQuery;
    qExcluir: TFDQuery;
    qPesquisarIdCliente: TFDAutoIncField;
    qPesquisarNomeReduzido: TStringField;
    qPesquisarRazaoSocial: TStringField;
    qPesquisarCNPJ: TStringField;
    qPesquisarCPF: TStringField;
    qPesquisarDtNascimento: TDateTimeField;
    qPesquisarDtTmCadastro: TDateTimeField;
    cdsPesquisarIdCliente: TAutoIncField;
    cdsPesquisarNomeReduzido: TStringField;
    cdsPesquisarRazaoSocial: TStringField;
    cdsPesquisarCNPJ: TStringField;
    cdsPesquisarCPF: TStringField;
    cdsPesquisarDtNascimento: TDateTimeField;
    cdsPesquisarDtTmCadastro: TDateTimeField;
    qAlterarIdCliente: TFDAutoIncField;
    qAlterarNomeReduzido: TStringField;
    qAlterarRazaoSocial: TStringField;
    qAlterarCNPJ: TStringField;
    qAlterarCPF: TStringField;
    qAlterarDtNascimento: TDateTimeField;
    qGrid: TFDQuery;
    FDAutoIncField1: TFDAutoIncField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
  private
    { Private declarations }
  public

    procedure Pesquisar(sNome: string);
    procedure CarregarCliente(oCliente: TCliente; iCodigo: Integer);
    function Inserir(oCliente: TCliente; out sErro: string): Boolean;
    function Alterar(oCliente: TCliente; out sErro: string): Boolean;
    function Excluir(iCodigo: Integer; out sErro: string): Boolean;

  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TdmPrincipal }

function TdmPrincipal.Alterar(oCliente: TCliente; out sErro: string): Boolean;
begin
  with qAlterar, oCliente do
  begin
    Params[0].AsString := NomeReduzido;
    Params[1].AsString := RazaoSocial;
    Params[2].AsString := CNPJ;
    Params[3].AsString := CPF;
    Params[4].AsDateTime := DtNascimento;
    Params[5].AsInteger := IdCliente;

    try
      ExecSQL();
      Result := true;
    except
      on E: exception do
      begin
        sErro := 'Ocorreu um erro ao Alterar o Cliente: ' + sLineBreak +
          E.message;
        Result := False;
      end;

    end;
  end;
end;

procedure TdmPrincipal.CarregarCliente(oCliente: TCliente; iCodigo: Integer);
var
  sqlCliente: TFDQuery;
begin
  sqlCliente := TFDQuery.Create(nil);
  try
    with sqlCliente do
    begin
      Connection := DmConexao.SqlConnection;
      SQL.Text := ('select * from TbClientes where (idCliente = ' +IntToStr(iCodigo) + ') ');
      Open;

      with oCliente do
      begin
        IdCliente := FieldByName('idCliente').AsInteger;
        NomeReduzido := FieldByName('NomeReduzido').AsString;
        RazaoSocial := FieldByName('RazaoSocial').AsString;
        CNPJ := FieldByName('CNPJ').AsString;
        CPF := FieldByName('CPF').AsString;
        DtNascimento := FieldByName('DtNascimento').AsDateTime;
        DtCadastro := FieldByName('DtTmCadastro').AsDateTime;
      end;
    end;
  finally
    FreeAndNil(sqlCliente);
  end;

end;

function TdmPrincipal.Excluir(iCodigo: Integer; out sErro: string): Boolean;
begin
  with qExcluir do
  begin
    Params[0].AsInteger := iCodigo;
    try
      ExecSQL();
      Result := true;
    except
      on E: exception do
      begin
        sErro := 'Ocorreu um erro ao Excluir: ' + sLineBreak + E.message;
        Result := False;
      end;

    end;
  end;
end;

function TdmPrincipal.Inserir(oCliente: TCliente; out sErro: string): Boolean;
begin
  with qInserir, oCliente do
  begin
    Params[0].AsString := NomeReduzido;
    Params[1].AsString := RazaoSocial;
    Params[2].AsString := CNPJ;
    Params[3].AsString := CPF;
    Params[4].AsDateTime := DtNascimento;
    Params[5].AsDateTime := Date();
    try
      ExecSQL();
      Result := true;
    except
      on E: exception do
      begin
        sErro := 'Ocorreu um erro ao Inserir Cliente: ' + sLineBreak +
          E.message;
        Result := False;
      end;

    end;
  end;
end;

procedure TdmPrincipal.Pesquisar(sNome: string);
begin
  if cdsPesquisar.Active then
    cdsPesquisar.Close;
  cdsPesquisar.Params[0].AsString := '%' + sNome + '%';
  cdsPesquisar.Open;
  cdsPesquisar.First;
end;

end.
