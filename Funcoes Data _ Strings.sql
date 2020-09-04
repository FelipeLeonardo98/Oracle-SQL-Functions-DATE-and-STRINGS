
SELECT *
FROM aluno;
-- FUNÇÃO PARA CONCATENAÇÃO
SELECT Concat(id_aluno,nome)
FROM aluno;
-- OR ISSO AQUI
SELECT id_aluno || '  - ' || nome
FROM aluno;

-- Initicap: deixa s� a primeira letra das palavras maisc�las
SELECT InitCap('jose da silva')
from dual;

--Upper: deixa tudo maisc�lo
SELECT Upper(nome)
FROM aluno;

--Lower: deixa tudo minisc�lo
SELECT Lower(nome)
FROM aluno;

--InStr: retorna a posi��o do caractere especificado em uma string(primeira ocorr�ncia)
-- exemplo: Amanda -> ele retorna a posi��o somente do primeiro "A"
SELECT nome, InStr(nome,'L')
FROM aluno;

--Length: tamanho da string
SELECT nome, Length(nome)
FROM aluno;

-- LPad: preenche A ESQUERDA - LEFT - uma quantidade de caracteres para simples preenchimento
-- e formata��o. No exemplo ele preenche 4 casas a esquerda com '0'
SELECT id_aluno, LPad(id_aluno,5,'0')
FROM aluno;

-- RPad: preenche A DIREITA - RIGHT - uma quantidade de caracteres para simples preenchimento
-- e formata��o. No exemplo ele preenche 4 casas a direita com '0'
SELECT nome, salario , RPad(salario,5,'0')
FROM aluno;

-- SubStr(sub string) copia parte de um texto
--(campo/texto, posi��o, qtde de caracter)
SELECT nome, SubStr(nome,1,4)
FROM aluno;

--REPLACE: substitui um caractere por outro
SELECT REPLACE(nome, 'A','$')
FROM aluno;

-- duas fun��es juntas
SELECT SubStr(nome,Length(nome)-1,2)
FROM aluno;

-- -------------------------------------------------------------------------------------------

SELECT *
FROM aluno
WHERE Upper(nome) =  'ANDRE';

-- Teste: substituindo os 3 primeiros caracteres do campo cidade e comparando em upper
SELECT *
FROM ALUNO
WHERE Upper(SubStr(CIDADE,1,3)) = 'CAM';

UPDATE aluno
SET salario =633.47
WHERE id_aluno=1;

SELECT
  salario,
  REPLACE(SALARIO, ',' , ''),
  RPad(SALARIO, 10, '0'), -- ZEROS A DIREITA AT� 10 CASAS
  LPad(SALARIO, 10, '0'), -- ZEROS A ESQUERDA AT� 10 CASAS
  LPad(REPLACE(SALARIO,',', ''),10,'0')
FROM ALUNO;

-- -------------FUN��ES DE DATA E HORA  ---------------------------------------------
-- DUAL � UMA TABELA VIRTUAL
SELECT *
FROM DUAL;

-- sYSdATE RETORNA  DATA/HORA DO SERVIDOR.
SELECT SYSDATE
FROM DUAL;

--Round e Trunc
SELECT Round(45.925, 2) AS "Round: arredonda pra cima", -- 45.93
  Trunc(45.929,2) AS "Trunc: arredonda pra baixo", -- 45.92
  Mod(10 , 2) AS "Resto da Divisao",
  Trunc(1.99), -- Arredonda pra cima
  Trunc(1.99,2)
FROM dual;

SELECT *
FROM contrato;

SELECT data, SYSDATE, data + 5
FROM contrato;
-- somar o campo data + 5 dias

-- Pode-se fazer c�lculos de diferen�a de dias, pegando a data do server(Sysdate) e comparando
-- com o campo da data de uma tabela, assim arredondando os dias com Trunc
SELECT Trunc(SYSDATE - data) AS "Diferenca de Dias"
FROM contrato;

-- somando horas em uma data
SELECT sysdate , SYSDATE + (2/24) AS add_Horas
FROM contrato;

-- somando minutos
SELECT sysdate, SYSDATE + (15/1440) AS add_minutos
FROM contrato;

--somando segundos
SELECT SYSDATE, SYSDATE + 30/(3600 * 24) AS add_segundos
FROM contrato;

-- Hora fica 00:00:00
SELECT SYSDATE, Trunc(SYSDATE)
FROM dual;

--Diferen�a de meses entre datas: Months_Between
SELECT Months_Between (SYSDATE, SYSDATE - 90) AS Dif_Mes
FROM dual;

-- Adiciona Meses: Add(ADD_Months(CampoData,NumeroDeMeses)
SELECT ADD_Months(SYSDATE,4) AS adiciona_Mes_data
FROM dual;

--Proxima data a partir de um dia da semana
SELECT NEXT_DAY(SYSDATE, 'THURSDAY') AS Proxima_Quinta
FROM dual;

-- Ultimo dia do m�s que foi informada a data(ou a data corrente caso seja SYSDATE)
SELECT Last_Day(SYSDATE) AS UltimoDiaMes
FROM dual;

--Primeiro dia do pr�ximo m�s
--at� dia 15 do m�s pega o primeiro dia do m�s atual
-- a partir do dia 16 retorna dia do pr�ximo m�s
SELECT Round(SYSDATE,'Month') AS Primeiro_Dia_Mes_Corrente
FROM dual;

--Primeiro dia da data passada
SELECT Trunc(SYSDATE,'Month') AS Primeiro_Dia_Mes_Corrente
FROM dual;