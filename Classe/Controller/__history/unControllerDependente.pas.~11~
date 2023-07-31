unit unControllerDependente;

interface

uses
  System.Generics.Collections, Dependente, unDAODependente, Funcionario;

type

  TControllerDependente = class
  public
    function Salvar(Dependentes: TObjectList<TDependente>): Boolean; overload;
    function Salvar(Entidade: TDependente): Boolean; overload;

    function Remover(Dependentes: TObjectList<TDependente>): Boolean; overload;
    function Remover(Entidade: TDependente): Boolean; overload;

    function ObterListaDeDependentes(objFuncionario: TFuncionario): TObjectList<TDependente>;
  end;

implementation

{ TControllerDependente }

function TControllerDependente.ObterListaDeDependentes(
  objFuncionario: TFuncionario): TObjectList<TDependente>;
begin
  Result := TObjectList<TDependente>.Create;
  Result.Clear;
  if ((not Assigned(objFuncionario)) or (objFuncionario.Id = 0)) then
    Exit;
  Result := TDAODependente.ObterListaDeDependentes(objFuncionario);
end;

function TControllerDependente.Remover(Entidade: TDependente): Boolean;
var
  lResultado: Boolean;
begin
  lResultado := False;
  try
    if not Assigned(Entidade) then
      Exit;

    TDAODependente.Delete(Entidade);
    lResultado := True;
  finally
    Result := lResultado;
  end;
end;

function TControllerDependente.Remover(
  Dependentes: TObjectList<TDependente>): Boolean;
var
  lResultado: Boolean;
begin
  lResultado := False;
  try
    for var Dependente in Dependentes do
      Remover(Dependente);
    lResultado := True;
  finally
    Result := lResultado;
  end;
end;

function TControllerDependente.Salvar(Entidade: TDependente): Boolean;
var
  lResultado: Boolean;
begin
  lResultado := False;
  try
    if Entidade.Id = 0 then
       TDAODependente.Insert(Entidade)
    else
      TDAODependente.Update(Entidade);
    lResultado := True;
  finally
    Result := lResultado;
  end;
end;

function TControllerDependente.Salvar(
  Dependentes: TObjectList<TDependente>): Boolean;
var
  lResultado: Boolean;
begin
  lResultado := False;
  try
    for var Dependente in Dependentes do
    begin
      Salvar(Dependente);
    end;
    lResultado := True;
  finally
    Result := lResultado;
  end;
end;

end.
