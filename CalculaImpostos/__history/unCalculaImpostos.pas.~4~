unit unCalculaImpostos;

interface

type

  TCalculo = class
  private
    function CalculaImposto(): Double; virtual; abstract;
  end;


  TImposto = class(TCalculo)
  private
    FValorBase: Double;
    FNumeroDependentes: Integer;
    FPossuiDependenteINSS: Boolean;
  public
    function CalculaImposto(): Double; override;

    property ValorBase: Double read FValorBase write FValorBase;
    property NumeroDependentes: Integer read FNumeroDependentes write FNumeroDependentes;
    property PossuiDependenteINSS: Boolean read FPossuiDependenteINSS write FPossuiDependenteINSS;
  end;


  TCalculoIR = class(TImposto)
  public
    function CalculaImposto(): Double; override;
  end;


  TCalculoINSS = class(TImposto)
  public
    function CalculaImposto(): Double; override;
  end;


const
  PERCENTUAL_INSS: Integer = 8;
  PERCENTUAL_IR: Integer = 15;
  DEDUCAO_IR: Double = 100;


implementation

{ TCalculoIR }

function TCalculoIR.CalculaImposto: Double;
var
  nResultado: Double;
begin
  nResultado := 0;
  try
    nResultado := (ValorBase - (NumeroDependentes * DEDUCAO_IR)) * (PERCENTUAL_IR / 100);
    if nResultado < 0 then
      nResultado := 0;
  finally
    Result := nResultado;
  end;
end;

{ TCalculoINSS }

function TCalculoINSS.CalculaImposto: Double;
var
  nResultado: Double;
begin
  nResultado := 0;
  try
    if not PossuiDependenteINSS then
      Exit;
    nResultado := (ValorBase * PERCENTUAL_INSS / 100);
    if nResultado < 0 then
      nResultado := 0;
  finally
    Result := nResultado;
  end;
end;

{ TImposto }

function TImposto.CalculaImposto: Double;
begin
  Result := 0;
end;

end.
