unit unControllerFuncionario;

interface

uses
  System.Generics.Collections, Funcionario, unDAOFuncionario;

type

  TControllerFuncionario = class
  public
    function Salvar(Entidade: TFuncionario): Integer;
    function Remover(Entidade: TFuncionario): Boolean;
    function ObterFuncionario(Id: Integer): TFuncionario;
    function ObterListaFuncionarios(): TObjectList<TFuncionario>;
  end;

implementation

{ TControllerFuncionario }

function TControllerFuncionario.ObterFuncionario(Id: Integer): TFuncionario;
begin
  Result := nil;
  if Id = 0 then
    Exit;

  Result := TFuncionario.Create;
  var DataSet := TDAOFuncionario.Load(Id);
  try
    Result.Id := DataSet.FieldByName('ID').AsInteger;
    Result.Nome := DataSet.FieldByName('NOME').AsString;
    Result.CPF := DataSet.FieldByName('CPF').AsString;
    Result.Salario := DataSet.FieldByName('SALARIO').AsFloat;
  finally
    DataSet.DisposeOf;
  end;
end;

function TControllerFuncionario.ObterListaFuncionarios: TObjectList<TFuncionario>;
begin
  Result := TDAOFuncionario.ObterListaFuncionarios();
end;

function TControllerFuncionario.Remover(Entidade: TFuncionario): Boolean;
var
  lResultado: Boolean;
begin
  lResultado := False;
  try
    if not Assigned(Entidade) then
      Exit;

    TDAOFuncionario.Delete(Entidade);
    lResultado := True;
  finally
    Result := lResultado;
  end;
end;

function TControllerFuncionario.Salvar(Entidade: TFuncionario): Integer;
var
  nResultado: Integer;
begin
  nResultado := 0;
  try
    if Entidade.Id = 0 then
      nResultado := TDAOFuncionario.Insert(Entidade)
    else
      nResultado := TDAOFuncionario.Update(Entidade);

  finally
    Result := nResultado;
  end;
end;

end.
