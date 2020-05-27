-- ART-02) Ranking de músicas mais ouvidas em um determinado período X?

SELECT titulo AS 'MUSICA', COUNT(*) AS QTD_REPRODUCOES
FROM ((
	SELECT musica.titulo AS titulo, escuta.mus_id
	FROM escuta, musica 
	WHERE escuta.mus_id = musica.id AND data LIKE '2019%') AS X)
GROUP BY titulo
ORDER BY QTD_REPRODUCOES desc;