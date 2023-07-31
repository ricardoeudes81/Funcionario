program CalculoFuncionario;

uses
  Vcl.Forms,
  View.unPrincipal in 'View\View.unPrincipal.pas' {frmPrincipal},
  Entidade.Funcionario in 'Classe\Entidade\Entidade.Funcionario.pas',
  Entidade.Dependente in 'Classe\Entidade\Entidade.Dependente.pas',
  View.unCadFuncionario in 'View\View.unCadFuncionario.pas' {frmCadFuncionario},
  Controller.unControllerFuncionario in 'Classe\Controller\Controller.unControllerFuncionario.pas',
  Conexao.unConection in 'Classe\Conexao\Conexao.unConection.pas',
  View.unCadDependente in 'View\View.unCadDependente.pas' {frmCadDependente},
  Controller.unControllerDependente in 'Classe\Controller\Controller.unControllerDependente.pas',
  View.unPesquisa in 'View\View.unPesquisa.pas' {frmPesquisa},
  Helper.unMaskEditHelper in 'Helper\Helper.unMaskEditHelper.pas',
  Utils.unUtils in 'Utils\Utils.unUtils.pas',
  CalculaImpostos.unCalculaImpostos in 'CalculaImpostos\CalculaImpostos.unCalculaImpostos.pas',
  View.Controller.CadFuncionario in 'View\Controller\View.Controller.CadFuncionario.pas',
  Entidade.Entidade in 'Classe\Entidade\Entidade.Entidade.pas',
  DAO.unDAOGenerico in 'Classe\DAO\DAO.unDAOGenerico.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
