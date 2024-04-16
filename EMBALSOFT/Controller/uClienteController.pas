unit uClienteController;

interface

uses
  uClienteModel, System.SysUtils, uDmPrincipal;

type
  TClienteConroller = class
  public
    constructor Create;
    destructor Destroy; override;
    procedure Pesquisar(sNome:string);
    procedure CarregarCliente(oCliente:TCliente; iCodigo: Integer);

    function Inserir(oCliente: TCliente; var sERRO: string): Boolean;
    function Alterar(oCliente: TCliente; var sERRO: string): Boolean;
    Function Exlcuir(icodigo: Integer; var sERRO: string): Boolean;
  end;

implementation

{ TClienteConroller }

function TClienteConroller.Alterar(oCliente: TCliente;
  var sERRO: string): Boolean;
begin
  Result := dmPrincipal.Alterar(oCliente, sERRO);
end;

procedure TClienteConroller.CarregarCliente(oCliente: TCliente; iCodigo: Integer);
begin
 dmPrincipal.CarregarCliente(oCliente, iCodigo);
end;

constructor TClienteConroller.Create;
begin
 //
end;

destructor TClienteConroller.Destroy;
begin
  inherited;
end;

function TClienteConroller.Exlcuir(icodigo: Integer; var sERRO: string) : Boolean;
begin
  Result := dmPrincipal.Excluir(icodigo, sERRO);
end;

function TClienteConroller.Inserir(oCliente: TCliente;
  var sERRO: string): Boolean;
begin
  Result := dmPrincipal.Inserir(oCliente, sERRO);
end;

procedure TClienteConroller.Pesquisar(sNome: string);
begin
  dmPrincipal.Pesquisar(sNome);
end;

end.
