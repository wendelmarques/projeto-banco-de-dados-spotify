-- ADM - 04) Ranking de músicas mais ouvidas n lugar X no periodo Y.


SELECT titulo, count(*) AS QTD_REPRODUCOES
FROM ((
	SELECT idM, titulo, idU, cidade
	FROM ((
SELECT mus_id AS idM, idU, cidade
FROM ((SELECT id_usuario AS idU, cidade_residencia AS cidade
FROM usuario
WHERE cidade_residencia LIKE '%/BR') AS ouvi_cidade),escuta WHERE idU = escuta.id_ouvinte_escuta AND escuta.data LIKE '2019%') AS mus_idU_cidade) NATURAL JOIN musica
WHERE musica.id = idM) AS X)
GROUP BY titulo
ORDER BY QTD_REPRODUCOES desc