-- ADM 03) Qual a quantidade total de contas premium e de conta free? 

SELECT TIPO_DE_CONTA, COUNT(*) AS QTD_REPRODUCOES
FROM ((
	SELECT tipo_conta AS TIPO_DE_CONTA
	FROM ouvinte) AS X)
GROUP BY TIPO_DE_CONTA
ORDER BY QTD_REPRODUCOES desc;