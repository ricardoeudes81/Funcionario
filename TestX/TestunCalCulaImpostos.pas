unit TestunCalCulaImpostos;

interface

uses
  DUnitX.TestFramework, CalculaImpostos.unCalculaImpostos;

type
  [TestFixture]
  TestXunCalCulaImpostos = class
  strict private
    FImposto: TImposto;
    FCalculoIR: TCalculoIR;
    FCalculoINSS: TCalculoINSS;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    // Sample Methods
    // Simple single Test
//    [Test]
//    procedure Test1;
    // Test with TestCase Attribute to supply parameters.
    [Test]
    [TestCase('FImposto','1000,2,True,0')]
    procedure TestCalculaImposto(const AValor: Double; NrDependentes: Integer;
      PossuiDependentesIR: Boolean; AValorEsperado: Double);

    [Test]
    [TestCase('FCalculoIR','1000,2,True,120')]
    procedure TestCalculaImposto_IR(const AValor: Double; NrDependentes: Integer;
      PossuiDependentesIR: Boolean; AValorEsperado: Double);

    [Test]
    [TestCase('FCalculoIR','1000,2,True,80')]
    procedure TestCalculaImposto_INSS(const AValor: Double; NrDependentes: Integer;
      PossuiDependentesIR: Boolean; AValorEsperado: Double);
  end;

implementation

procedure TestXunCalCulaImpostos.Setup;
begin
    FImposto := TImposto.Create;
    FCalculoIR := TCalculoIR.Create;
    FCalculoINSS := TCalculoINSS.Create;
end;

procedure TestXunCalCulaImpostos.TearDown;
begin
    FImposto.Free;
    FImposto := nil;

    FCalculoIR.Free;
    FCalculoIR := nil;

    FCalculoINSS.Free;
    FCalculoINSS := nil;
end;

//procedure TestXunCalCulaImpostos.Test1;
//begin
//end;

procedure TestXunCalCulaImpostos.TestCalculaImposto(const AValor: Double; NrDependentes: Integer;
      PossuiDependentesIR: Boolean; AValorEsperado: Double);
begin
  FImposto.ValorBase := AValor;
  FImposto.NumeroDependentes := NrDependentes;
  FImposto.PossuiDependenteINSS := PossuiDependentesIR;

  var valorObtido := FImposto.CalculaImposto;
  Assert.AreEqual<Double>(AValorEsperado, valorObtido, 'Teste CalculaImposto de TImposto');
end;

procedure TestXunCalCulaImpostos.TestCalculaImposto_INSS(const AValor: Double;
  NrDependentes: Integer; PossuiDependentesIR: Boolean; AValorEsperado: Double);
begin
  FCalculoINSS.ValorBase := AValor;
  FCalculoINSS.NumeroDependentes := NrDependentes;
  FCalculoINSS.PossuiDependenteINSS := PossuiDependentesIR;

  var valorObtido := FCalculoINSS.CalculaImposto;
  Assert.AreEqual<Double>(AValorEsperado, valorObtido, 'Teste CalculaImposto de TCalculoIR');
end;

procedure TestXunCalCulaImpostos.TestCalculaImposto_IR(const AValor: Double;
  NrDependentes: Integer; PossuiDependentesIR: Boolean; AValorEsperado: Double);
begin
  FCalculoIR.ValorBase := AValor;
  FCalculoIR.NumeroDependentes := NrDependentes;
  FCalculoIR.PossuiDependenteINSS := PossuiDependentesIR;

  var valorObtido := FCalculoIR.CalculaImposto;
  Assert.AreEqual<Double>(AValorEsperado, valorObtido, 'Teste CalculaImposto de TCalculoIR');
end;

initialization
  TDUnitX.RegisterTestFixture(TestXunCalCulaImpostos);

end.
