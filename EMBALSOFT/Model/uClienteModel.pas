unit uClienteModel;

interface

uses
  System.SysUtils;

type
  TCliente = class
  private
    FCNPJ: string;
    FIdContato: Integer;
    FDtCadastro: TDateTime;
    FCPF: string;
    FNomeReduzido: string;
    FDtNascimento: TDateTime;
    FRazaoSocial: string;
    FIdCliente: Integer;
    FNome: string;
    procedure SetNomeReduzido(const Value: string);
    procedure SetFNome(const Value: string);
  public
    property IdCliente: Integer read FIdCliente write FIdCliente;
    property NomeReduzido: string read FNomeReduzido write SetNomeReduzido;
    property RazaoSocial: string read FRazaoSocial write FRazaoSocial;
    property CNPJ: string read FCNPJ write FCNPJ;
    property CPF: string read FCPF write FCPF;
    property DtNascimento: TDateTime read FDtNascimento write FDtNascimento;
    property DtCadastro: TDateTime read FDtCadastro write FDtCadastro;

    property IdContato: Integer read FIdContato write FIdContato;
    property Nome: string read FNome write SetFNome;

  end;

implementation

{ TCliente }

procedure TCliente.SetFNome(const Value: string);
begin
  if Value = EmptyStr then
    raise EArgumentException.Create('Nome precisa ser preenchido!');
  FNome := Value;
end;

procedure TCliente.SetNomeReduzido(const Value: string);
begin
  if Value = EmptyStr then
    raise EArgumentException.Create('Nome Reduzido precisa ser preenchido!');
  FNomeReduzido := Value;
end;

end.
