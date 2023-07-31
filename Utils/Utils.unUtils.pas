unit Utils.unUtils;

interface

uses
  System.SysUtils, Entidade.Entidade, Rtti, System.Generics.Collections,
  SimpleAttributes;

type

  TTipoAcao = (taNavegar, taInserir, taEditar, taConsultar);


  TUtils = class
  public
    class function TransformaValorStringParaFloat(valor: string): Double;
    class function GetTableName(Objeto: TObject): string;
  end;


const
  FORMATO_VALOR: string = '###,###,###,###,###,##0.00';
  VALOR_ZERO: string = '0,00';


type
  TTipoSimNao = (tpSim, tpNao);
const
  TSimNao: array[TTipoSimNao] of string = ('Sim', 'Não');


implementation

{ TUtils }

class function TUtils.GetTableName(Objeto: TObject): string;
var
  Ctx: TRttiContext;
  Tipo: TRttiType;
  Atrib: TCustomAttribute;
begin
  Ctx := TRttiContext.Create;
  Tipo := Ctx.GetType(Objeto.ClassType);
  try
    Result := EmptyStr;
    if Tipo <> nil then
    begin
        for Atrib in Tipo.GetAttributes do
        begin
          if Atrib is Tabela then
          begin
            Result := Trim(Tabela(Atrib).Name);
            Break;
          end;
        end;;
    end;
  finally
    Ctx.Free;
  end;
end;

class function TUtils.TransformaValorStringParaFloat(valor: string): Double;
begin
  Result := StrToFloatDef(StringReplace(valor, '.', '', [rfReplaceAll]), 0);
end;

end.
