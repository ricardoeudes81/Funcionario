unit Entidade.Funcionario;

interface

uses
  Entidade.Entidade, System.Generics.Collections, System.SysUtils, Entidade.Dependente, System.Classes,
  SimpleAttributes;

type

  [Tabela('FUNCIONARIO')]
  TFuncionario = class(TEntidade)
  private
    FNome: string;
    FCPF: string;
    FSalario: Double;
    FINSS: Double;
    FIR: Double;
    FDependentes: TObjectList<TDependente>;
    function GetDependentes: TObjectList<TDependente>;
    procedure SetDependentes(const Value: TObjectList<TDependente>);
  public
    constructor Create;
    destructor Destroy; override;

    [Campo('NOME'), NotNull]
    property Nome: string read FNome write FNome;
    [Campo('CPF'), NumberOnly, NotNull]
    property CPF: string read FCPF write FCPF;
    [Campo('SALARIO'), NotNull]
    property Salario: Double read FSalario write FSalario;
    [Ignore]
    property INSS: Double read FINSS write FINSS;
    [Ignore]
    property IR: Double read FIR write FIR;
    [Ignore]
    property Dependentes: TObjectList<TDependente> read GetDependentes write SetDependentes;
  end;


implementation

{ TFuncionario }

constructor TFuncionario.Create;
begin
  inherited;
end;

destructor TFuncionario.Destroy;
begin
  if Assigned(FDependentes) then
    FDependentes.DisposeOf;
  inherited;
end;

function TFuncionario.GetDependentes: TObjectList<TDependente>;
begin
  if not Assigned(FDependentes) then
    FDependentes := TObjectList<TDependente>.Create;
  Result := FDependentes;
end;

procedure TFuncionario.SetDependentes(const Value: TObjectList<TDependente>);
begin
  FDependentes := Value;
end;

initialization
  RegisterClass(TFuncionario);

end.
