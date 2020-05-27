-- OUV-03) Qual a soma do tempo das músicas que um usuário X ouviu no período Y? 
SELECT time_format( SEC_TO_TIME( SUM( TIME_TO_SEC( duracao))),'%H:%i:%s') AS 'TOTAL'
FROM (( 
	SELECT duracao
 FROM((
SELECT mus_id AS IDM
FROM escuta 
WHERE data LIKE '2019%' AND id_ouvinte_escuta = '999123456') AS Y) NATURAL JOIN musica
WHERE IDM = musica.id) AS RESU);