unit CadFuncionario;

interface

uses
  System.Generics.Collections, System.Classes, unControllerFuncionario;

type

  IControllerCadFuncionario = interface
    function ExcluirCadastroFuncionario(AIdFuncionario: Integer): IControllerCadFuncionario;
  end;

  TControllerCadFuncionario = class(TInterfacedPersistent, IControllerCadFuncionario)
  public
    function ExcluirCadastroFuncionario(AIdFuncionario: Integer): IControllerCadFuncionario;
  end;

implementation

{ TControllerCadFuncionario }

function TControllerCadFuncionario.ExcluirCadastroFuncionario(
  AIdFuncionario: Integer): IControllerCadFuncionario;
begin
  Result := Self;
  var ControllerFunc := TControllerFuncionario.New;
  var objFuncionario := ControllerFunc.ObterFuncionario(AIdFuncionario);
  ControllerFunc.Remover(objFuncionario);
end;

end.
