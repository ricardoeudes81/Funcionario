unit View.Controller.CadDependente;

interface

uses
  System.Classes, unControllerDependente, Dependente;

type

  IControllerCadDependente = interface
  ['{01489B0C-5038-4421-87D5-3F2720934418}']
    function ExcluirCadastroDependente(ADependente: TDependente): IControllerCadDependente;
  end;

  TControllerCadDependente = class(TInterfacedPersistent, IControllerCadDependente)
  public
    function ExcluirCadastroDependente(ADependente: TDependente): IControllerCadDependente;
    class function New: IControllerCadDependente;
  end;

implementation

{ TControllerCadDependente }

function TControllerCadDependente.ExcluirCadastroDependente(
  ADependente: TDependente): IControllerCadDependente;
begin
  Result := Self;
  TControllerDependente.New.Remover(ADependente);
end;

class function TControllerCadDependente.New: IControllerCadDependente;
begin
  Result := Self.Create;
end;

end.
