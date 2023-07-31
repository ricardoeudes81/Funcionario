unit View.Controller.CadFuncionario;

interface

uses
  System.Generics.Collections, System.Classes, Controller.unControllerFuncionario,
  Controller.unControllerDependente, Entidade.Dependente, Entidade.Funcionario;

type

  IControllerCadFuncionario = interface
  ['{391B80CD-D5C4-4537-BD09-F9198C40DBEA}']
    function ExcluirCadastroFuncionario(AIdFuncionario: Integer): IControllerCadFuncionario;
    function ExcluirCadastroDependentes(ALista: TObjectList<TDependente>): IControllerCadFuncionario;
    function ExcluirCadastroDependenteUnico(ADependente: TDependente): IControllerCadFuncionario;
    function SalvarCadastroFuncionario(var AFuncionario: TFuncionario): IControllerCadFuncionario;
    function SalvarCadastroDependentes(AFuncionario: TFuncionario): IControllerCadFuncionario;
  end;

  TControllerCadFuncionario = class(TInterfacedPersistent, IControllerCadFuncionario)
  private
    class function ExtrairListaDependentes(AFuncionario: TFuncionario): TObjectList<TDependente>;
  public
    function ExcluirCadastroFuncionario(AIdFuncionario: Integer): IControllerCadFuncionario;
    function ExcluirCadastroDependentes(ALista: TObjectList<TDependente>): IControllerCadFuncionario;
    function ExcluirCadastroDependenteUnico(ADependente: TDependente): IControllerCadFuncionario;
    function SalvarCadastroFuncionario(var AFuncionario: TFuncionario): IControllerCadFuncionario;
    function SalvarCadastroDependentes(AFuncionario: TFuncionario): IControllerCadFuncionario;
    class function New: IControllerCadFuncionario;
  end;

implementation

{ TControllerCadFuncionario }

function TControllerCadFuncionario.ExcluirCadastroDependentes(
  ALista: TObjectList<TDependente>): IControllerCadFuncionario;
begin
  Result := Self;
  TControllerDependente.New.Remover(ALista);
end;

function TControllerCadFuncionario.ExcluirCadastroDependenteUnico(
  ADependente: TDependente): IControllerCadFuncionario;
begin
  Result := Self;
  TControllerDependente.New.Remover(ADependente);
end;

function TControllerCadFuncionario.ExcluirCadastroFuncionario(
  AIdFuncionario: Integer): IControllerCadFuncionario;
begin
  Result := Self;
  var ControllerFunc := TControllerFuncionario.New;
  var objFuncionario := ControllerFunc.ObterFuncionario(AIdFuncionario);
  ControllerFunc.Remover(objFuncionario);
end;

class function TControllerCadFuncionario.ExtrairListaDependentes(
  AFuncionario: TFuncionario): TObjectList<TDependente>;
begin
  Result := TObjectList<TDependente>.Create;
  for var Dependente in AFuncionario.Dependentes do
  begin
    var Dep := TDependente.Create;
    Dep.Id := Dependente.Id;
    Dep.IdFuncionario := AFuncionario.Id;
    Dep.Nome := Dependente.Nome;
    Dep.CalculaIR := Dependente.CalculaIR;
    Dep.CalculaINSS := Dependente.CalculaINSS;
    Result.Add(Dep);
  end;
end;

class function TControllerCadFuncionario.New: IControllerCadFuncionario;
begin
  Result := Self.Create;
end;

function TControllerCadFuncionario.SalvarCadastroDependentes(
  AFuncionario: TFuncionario): IControllerCadFuncionario;
begin
  Result := Self;
  var ListaDepedentes := TControllerCadFuncionario.ExtrairListaDependentes(AFuncionario);
  try
    TControllerDependente.New.Salvar(ListaDepedentes);
  finally
    ListaDepedentes.DisposeOf;
  end;
end;

function TControllerCadFuncionario.SalvarCadastroFuncionario(
  var AFuncionario: TFuncionario): IControllerCadFuncionario;
begin
  Result := Self;
  var IdFuncionario := TControllerFuncionario.New.Salvar(AFuncionario);
  AFuncionario.Id := IdFuncionario;
end;

end.
