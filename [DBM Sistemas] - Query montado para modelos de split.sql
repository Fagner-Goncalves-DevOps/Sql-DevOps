-- EXEMPLO 1 � SEPARANDO DE FORMA SIMPLES UMA STRING �
SELECT * 
FROM STRING_SPLIT('JUNIOR,GALV�O,MVP,SQL SERVER',',')
GO



-- EXEMPLO 2 � FAZENDO USO DE VARI�VEIS COMO PAR�METROS DE ENTRADA DE VALORES �
DECLARE @STRING VARCHAR(100) = 'MICROSOFT,SQL SERVER,2016,RC0',
                @SEPARADOR CHAR(1) =','

SELECT * 
FROM STRING_SPLIT(@STRING,@SEPARADOR)
GO






-- EXEMPLO 3 � ARMAZENANDO O RESULTADO DA DIVIS�O DE UMA STRING EM UMA NOVA TABELA �
DECLARE @STRING VARCHAR(100) = 'MICROSOFT,SQL SERVER,2016,RC0',
        @SEPARADOR CHAR(1) =','

SELECT * INTO #SPLITTABLE
FROM STRING_SPLIT(@STRING,@SEPARADOR)
GO





-- VISUALIZANDO A ESTRUTURA DA TABELA --
SP_COLUMNS #SPLITTABLE
GO

-- CONSULTANDO OS DADOS DA TABELA --
SELECT * FROM #SPLITTABLE
GO





-- EXEMPLO 4 � APRESENTANDO A MENSAGEM QUANDO O SEPARADOR DE STRING FOR DEFINIDO COM MAIS DE UM CARACTER --
DECLARE @STRING VARCHAR(100) = 'PEDROGALVAOJUNIOR#@GMAIL#@COM',
                @SEPARADOR CHAR(2) ='#@'

SELECT * FROM STRING_SPLIT(@STRING,@SEPARADOR)
GO




-- EXEMPLO 5 � APRESENTANDO O COMPORTAMENTO DA STRING_SPLIT() QUANDO UM PAR�METRO APRESENTA VALOR NULO �
SELECT * FROM STRING_SPLIT('PEDROGALVAOJUNIOR,WORDPRESS,COM',NULL)
GO




-- EXEMPLO 6 � REALIZANDO O SPLIT DE UMA STRING COM BASE NA JUN��O DE UMA TABELA COM A FUN��O STRING_SPLIT() �
-- CRIANDO A TABELA SPLIT --
CREATE TABLE SPLIT
( SPLITID INT IDENTITY (1,1) NOT NULL,
  SPLITVALUE1 NVARCHAR(50), 
  SPLITVALUE2 NVARCHAR(50))
GO

-- INSERINDO LINHAS DE REGISTRO --
INSERT INTO SPLIT (SPLITVALUE1, SPLITVALUE2)
VALUES ('PEDRO','GALV�O'),
              ('JUNIOR','GALV�O'),
              ('ANTONIO','SILVA'),
			  ('CHICO','BENTO')
GO

-- REALIZANDO A JUN��O DA TABELA SPLIT COM A FUN��O SPLIT_STRING() --
SELECT SPLITID, SPLITVALUE1, SPLITVALUE2, VALUE 
FROM SPLIT S INNER JOIN STRING_SPLIT('PEDRO,ANTONIO',',') STS
				  ON S.SPLITVALUE1 = STS.VALUE
GO






-- EXEMPLO 7 � APRESENTANDO O RESULTADO QUANDO AMBOS OS PAR�METROS VAZIOS �
SELECT * FROM STRING_SPLIT(' ',',')
GO

-- EXEMPLO 8 � APRESENTANDO O COMPORTAMENTO DA STRING_SPLIT() QUANDO O CARACTER DO FINAL DA STRING � O MESMO UTILIZADO COMO SEPARADOR �
SELECT * FROM STRING_SPLIT('CONHECENDO,SQL SERVER,2016,',',')
GO
