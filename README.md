# Funcionario
Projeto para estudos utilizando técnicas de orientação a objetos

	Para uma melhor agilidade na construção, foram adotados: 
	
		SimpleORM -> ORM Simples para Aplicações Delphi, disponível em:
			https://github.com/academiadocodigo/SimpleORM

		Instalado facilmente com o auxílio do gerenciador de dependências BOSS, diponível em:
			https://github.com/HashLoad/boss

	Com isto, as classes foram mapeadas possibilitando o uso de um único DAO para persitência, fazendo uso de uma
	conexão seguindo o padrão Singleton.

	Banco de dados utilizado: SQLite
	Criar um banco de dados com o auxílio de um SGBD, dar um nome para ele.
		Exemplo: "Dados.db"
	Dentro do banco criado é só rodar o arquivo "Script.sql" que se encontra no diretório "Script".
	Feito isso, temos que informar o nome do banco no arquivo "app.ini" que se encontra no mesmo diretório do executável da aplicação:
		..\Win32\Debug
	Dentro do arquivo app.ini devemos informar como no exemplo:
		[Conexao]
		Base=Dados.db
		
	Para este teste, o banco já esta criado com as devidas tabelas.
	

		Neste projeto temos a relação entre Funcionários e Dependentes, e ainda o cálculo de impostos aplicados ao funcionário.
		Regras:

	* Criar uma classe Funcionário com as seguintes propriedades 
		* (Nome, CPF, Salário) 
	* Criar uma classe Dependente com as seguintes propriedades 
		* (Nome, IsCalculaIR, IsCalculaINSS)	
	* A classe de Funcionario terá uma lista de dependentes
	* Cálculo de INSS e IR aplicado ao funcionário usando o valor do salário como base.
		* Regras de negócio
			* INSS - O cálculo de INSS será descontado 8% do valor do funcionário caso o dependente calcula INSS
			* IR – O cálculo de IR será deduzido da base, salário 100 reais para cada dependente que possuir calcula IR e por fim desconta 15% do salário do funcionário.
			* Ex. Funcionário que ganha 1000,00 e que tenha dois dependentes onde o IsCalculaIR e IsCalculaINSS estejam marcados.
			* INSS = 1000,00 – 8% = 80,00
			* IR = 1000,00 - (2 * 100) = 800,00 – 15% = 120,00.		
	* Criar a mesma estrutura em um banco de dados e gravar as informações usando uma camada de banco de dados para o acesso.
