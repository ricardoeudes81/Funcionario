CREATE TABLE FUNCIONARIO (
	ID		INTEGER NOT NULL,
	NOME	VARCHAR(80) NOT NULL,
	CPF		VARCHAR(14) NOT NULL,
	SALARIO	NUMERIC(10) NOT NULL,
	
	CONSTRAINT PK_FUNCIONARIO PRIMARY KEY (ID)
);


CREATE TABLE DEPENDENTE (
	ID				INTEGER NOT NULL,
	ID_FUNCIONARIO	INTEGER NOT NULL,
	NOME			VARCHAR(80) NOT NULL,
	CALCULAIR		INTEGER,
	CALCULAINSS		INTEGER,
	
	CONSTRAINT PK_DEPENDENTE PRIMARY KEY (ID),
    CONSTRAINT FK_DEPENDNETE_FUNCIONARIO FOREIGN KEY (ID_FUNCIONARIO) REFERENCES FUNCIONARIO(ID),
	CONSTRAINT CK_DEPENDNETE_CALCULAIR CHECK (CALCULAIR IN (0, 1)),
	CONSTRAINT CK_DEPENDNETE_CALCULAINSS CHECK (CALCULAINSS IN (0, 1))
);