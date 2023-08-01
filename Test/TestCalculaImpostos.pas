unit TestCalculaImpostos;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, CalculaImpostos.unCalculaImpostos;

type
  // Test methods for class TCalculo

  TestTCalculo = class(TTestCase)
  strict private
    FCalculo: TCalculo;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  end;
  // Test methods for class TImposto

  TestTImposto = class(TTestCase)
  strict private
    FImposto: TImposto;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestCalculaImposto;
  end;
  // Test methods for class TCalculoIR

  TestTCalculoIR = class(TTestCase)
  strict private
    FCalculoIR: TCalculoIR;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestCalculaImposto;
  end;
  // Test methods for class TCalculoINSS

  TestTCalculoINSS = class(TTestCase)
  strict private
    FCalculoINSS: TCalculoINSS;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestCalculaImposto;
  end;

implementation

procedure TestTCalculo.SetUp;
begin
  FCalculo := TCalculo.Create;
end;

procedure TestTCalculo.TearDown;
begin
  FCalculo.Free;
  FCalculo := nil;
end;

procedure TestTImposto.SetUp;
begin
  FImposto := TImposto.Create;
  FImposto.ValorBase := 1000;
  FImposto.NumeroDependentes := 2;
  FImposto.PossuiDependenteINSS := True;
end;

procedure TestTImposto.TearDown;
begin
  FImposto.Free;
  FImposto := nil;
end;

procedure TestTImposto.TestCalculaImposto;
var
  ReturnValue: Double;
begin
  ReturnValue := FImposto.CalculaImposto;
  // TODO: Validate method results
  CheckEquals(0, ReturnValue, 'O teste CalculaImposto de TImposto falhou.');
end;

procedure TestTCalculoIR.SetUp;
begin
  FCalculoIR := TCalculoIR.Create;
  FCalculoIR.ValorBase := 1000;
  FCalculoIR.NumeroDependentes := 2;
  FCalculoIR.PossuiDependenteINSS := True;
end;

procedure TestTCalculoIR.TearDown;
begin
  FCalculoIR.Free;
  FCalculoIR := nil;
end;

procedure TestTCalculoIR.TestCalculaImposto;
var
  ReturnValue: Double;
begin
  ReturnValue := FCalculoIR.CalculaImposto;
  // TODO: Validate method results
  CheckEquals(120, ReturnValue, 'O teste CalculaImposto de TCalculoIR falhou.');
end;

procedure TestTCalculoINSS.SetUp;
begin
  FCalculoINSS := TCalculoINSS.Create;
  FCalculoINSS.ValorBase := 1000;
  FCalculoINSS.NumeroDependentes := 2;
  FCalculoINSS.PossuiDependenteINSS := True;
end;

procedure TestTCalculoINSS.TearDown;
begin
  FCalculoINSS.Free;
  FCalculoINSS := nil;
end;

procedure TestTCalculoINSS.TestCalculaImposto;
var
  ReturnValue: Double;
begin
  ReturnValue := FCalculoINSS.CalculaImposto;
  // TODO: Validate method results
  CheckEquals(80, ReturnValue, 'O teste CalculaImposto de TCalculoINSS falhou.');
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTCalculo.Suite);
  RegisterTest(TestTImposto.Suite);
  RegisterTest(TestTCalculoIR.Suite);
  RegisterTest(TestTCalculoINSS.Suite);
end.
