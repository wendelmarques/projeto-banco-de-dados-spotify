-- ART-01) Qual é o ranking de álbuns mais ouvidos?
SELECT ALBUM AS 'ALBUNS MAIS OUVIDOS'
FROM ((
SELECT Nome_albumMus AS ALBUM, COUNT(*) AS QTD_REPRODUCOES
FROM ((
		SELECT mus_id AS ID_mus_Ouvida
		FROM escuta) AS X), musica
WHERE X.ID_mus_Ouvida = musica.id
GROUP BY ALBUM
ORDER BY QTD_REPRODUCOES desc) AS Y);
