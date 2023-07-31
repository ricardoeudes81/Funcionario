unit Controller.unControllerFuncionario;

interface

uses
  System.Generics.Collections, Entidade.Funcionario, DAO.unDAOGenerico, System.Classes;

type

  IControllerFuncionario = interface
  ['{2F3BA1FE-5638-464A-88A5-5A66EBAEDF90}']
    function Salvar(AEntidade: TFuncionario): Integer;
    function Remover(AEntidade: TFuncionario): Boolean;
    function ObterFuncionario(Id: Integer): TFuncionario;
    function ObterListaFuncionarios(): TObjectList<TFuncionario>;
  end;

  TControllerFuncionario = class(TInterfacedPersistent, IControllerFuncionario)
  public
    function Salvar(AEntidade: TFuncionario): Integer;
    function Remover(AEntidade: TFuncionario): Boolean;
    function ObterFuncionario(Id: Integer): TFuncionario;
    function ObterListaFuncionarios(): TObjectList<TFuncionario>;
    class function New: IControllerFuncionario;
  end;

implementation

{ TControllerFuncionario }

class function TControllerFuncionario.New: IControllerFuncionario;
begin
  Result := Self.Create;
end;

function TControllerFuncionario.ObterFuncionario(Id: Integer): TFuncionario;
begin
  Result := nil;
  if Id = 0 then
    Exit;

  Result := TFuncionario.Create;
  var DataSet := TDAOGenerico<TFuncionario>.New.Load(Id);
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
  Result := TObjectList<TFuncionario>(TDAOGenerico<TFuncionario>.New.GetListEntity());
end;

function TControllerFuncionario.Remover(AEntidade: TFuncionario): Boolean;
var
  lResultado: Boolean;
begin
  lResultado := False;
  try
    if not Assigned(AEntidade) then
      Exit;

    TDAOGenerico<TFuncionario>.New.Delete(AEntidade);
    lResultado := True;
  finally
    Result := lResultado;
  end;
end;

function TControllerFuncionario.Salvar(AEntidade: TFuncionario): Integer;
var
  nResultado: Integer;
begin
  nResultado := 0;
  try
    if AEntidade.Id = 0 then
      nResultado := TDAOGenerico<TFuncionario>.New.Insert(AEntidade)
    else
      nResultado := TDAOGenerico<TFuncionario>.New.Update(AEntidade);
  finally
    Result := nResultado;
  end;
end;

end.
