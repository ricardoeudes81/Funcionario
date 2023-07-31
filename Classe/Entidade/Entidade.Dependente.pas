unit Entidade.Dependente;

interface

uses
  Entidade.Entidade, System.Classes, SimpleAttributes;

type

  [Tabela('DEPENDENTE')]
  TDependente = class(TEntidade)
  private
    FIdFuncionario: Integer;
    FNome: string;
    FCalculaIR: Integer;
    FCalculaINSS: Integer;
  public
    [Campo('ID_FUNCIONARIO'), FK, NotNull, HasOne('FUNCIONARIO')]
    property IdFuncionario: Integer read FIdFuncionario write FIdFuncionario;
    [Campo('NOME'), NotNull]
    property Nome: string read FNome write FNome;
    [Campo('CALCULAIR')]
    property CalculaIR: Integer read FCalculaIR write FCalculaIR;
    [Campo('CALCULAINSS')]
    property CalculaINSS: Integer read FCalculaINSS write FCalculaINSS;
  end;

implementation

initialization
  RegisterClass(TDependente);

end.
