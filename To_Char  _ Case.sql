-- Formatação de Data

-- Conversor to_char(data, formato)
-- DD -> Dia do mês
SELECT SYSDATE, To_Char(SYSDATE,'DD') FROM dual;

-- DD/MM/YYYY -> Data Completa SEM hora
SELECT To_Char(SYSDATE,'DD/MM/YYYY') DATA FROM DUAL;

-- DD/MM -> Dia e Mês
SELECT To_Char(SYSDATE,'DD/MM') DIA_MES FROM DUAL;

-- DD -> Somente o dia
SELECT To_Char(SYSDATE,'DD') DIA FROM DUAL;

-- MM -> Somente o Mês
SELECT To_Char(SYSDATE,'MM') MES FROM DUAL;

-- YYYY -> Somente o ano
SELECT To_Char(SYSDATE,'YYYY') ANO FROM DUAL;

-- YY -> Ano com dois números
SELECT To_Char(SYSDATE,'YY') ANO FROM DUAL;

-- MONTH -> O nome do mês atual
SELECT To_Char(SYSDATE,'MONTH') MES1 FROM DUAL;

-- D -> O dia da semana em números, Domingo = 1, Segunda = 2 .....
SELECT To_Char(SYSDATE,'D') DIA_SEMANA FROM DUAL;

-- DY -> 3 PRIMEIRAS LETRAS DO DIA DA SEMANA
SELECT To_Char(SYSDATE,'DY') DIA_SEMANA FROM DUAL;

-- DAY -> DIA DA SEMANA POR EXTENSO
SELECT To_Char(SYSDATE,'DAY') DIA_SEMANA1 FROM DUAL;

-- YEAR -> ANO POR EXTENSO
SELECT To_Char(SYSDATE,'YEAR') ANO FROM DUAL;

-- DATA POR EXTENSO
SELECT To_Char(SYSDATE,' "PRAIA GRANDE, " fmDAY ", " DD "de" fmMonth "de" YYYY') FROM dual;

-- HH24:MI -> HORA ATUAL (HH24 para diferenciar de AM e PM)
SELECT To_Char(SYSDATE,'HH24:MI') HORA_MIN FROM DUAL;

--HH24:MI:SS - > HORA COMPLETA
SELECT To_Char(SYSDATE,'HH24:MI:SS') HORA_MIN_SEG FROM DUAL;

--DD/MM HH24:MI -> DIA, MÊS E HORA
SELECT To_Char(SYSDATE,'DD/MM HH24:MI') DATA_HORA FROM DUAL;

-- DD,MM,YYYY HH24:MI:SS -> DATA E HORA COMPLETA
SELECT To_Char(SYSDATE,'DD,MM,YYYY HH24:MI:SS') DATA_HORA FROM DUAL;

-----------------------------------------------
----L-> R$
---- G -> Ponto
----D-> Casas Decimais

--Trim serve para espaços em branco
SELECT Trim(To_Char(SALARIO,'L99999.99'))salario1, Trim(To_Char(SALARIO,'L99G999D99')) salario2
FROM  ALUNO;

--  Concatenação
SELECT 'R$ ' || (Round(SALARIO,2)) AS Salario FROM aluno;

-- Mesma coisa lá de cima
SELECT LPad(Trim((To_Char(5000,'L99999.99'))),'12',' ')from dual;

--------------------------------------------
---NVL E NVL2 -> Para tratar valores nulos

SELECT * FROM  contrato;
SELECT Total,
        Desconto,
        Desconto+Total,
        Nvl(Desconto,0),
        Nvl(Desconto,0) + Total,
        Nvl2(Desconto, Total, -1)
FROM Contrato;

SELECT * FROM aluno;
UPDATE aluno
SET nome = NULL
WHERE id_aluno = 5;

 -- mUDANDO O NOME DE NULL PARA 'SEM NOME'
SELECT id_aluno, Nvl(Nome,'SEM NOME') FROM ALUNO;

UPDATE ALUNO
SET ESTADO = 'SC'
WHERE ID_ALUNO = 4;

UPDATE ALUNO
SET ESTADO = 'RJ'
WHERE ID_ALUNO = 5;

SELECT * FROM aluno;

-- CASE
SELECT NOME, ESTADO,
       CASE
          WHEN Estado = 'RS' THEN 'Gaucho'
          WHEN Estado = 'AC' THEN 'ACREANO'
          WHEN Estado = 'RJ' and salario > 500 THEN 'Carioca'
          ELSE 'OUTROS'
          END AS "Apelido - CASE"
FROM aluno;

-- DECODE -> Mesma função que o case
SELECT nome, estado,
       Decode(Estado, 'RS', 'GAUCHO',
                      'AC', 'ACREANO',
                      'SP','PAULISTA',
                           'OUTROS') AS "APELIDO - DECODE"
FROM ALUNO;