-- OUV-02) Ranking de gêneros mais ouvidos no período X.

SELECT genero_musical AS 'GENEROS MUSICAIS MAIS OUVIDOS'
FROM ((
SELECT genero_musical, COUNT(*) AS QTD_REPRODUCOES
FROM ((
SELECT idartAlb
 FROM ((
SELECT Nome_albumMus
			FROM escuta, musica
		WHERE escuta.mus_id = musica.id AND data LIKE '20%') AS X), album
   	WHERE X.Nome_albumMus = album.nome_album) AS Y) , artista
WHERE Y.idartAlb = artista.id_user_artista
GROUP BY genero_musical
ORDER BY QTD_REPRODUCOES desc) AS U);