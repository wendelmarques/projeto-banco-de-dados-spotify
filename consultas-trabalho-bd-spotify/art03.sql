-- ART-03) Em quantas playlists a música X foi adicionada? 
SELECT titulo AS 'MUSICA', COUNT(*) AS 'QTD DE PLAYLIST' 
FROM musica 
        	INNER JOIN (possui
                    	INNER JOIN playlist 
                    	ON possui.possui_cod_playlist = playlist.cod_playlist)
        	ON possui.possui_mus_id = musica.id
WHERE 'T.N.T' = titulo 
GROUP BY titulo 
HAVING COUNT(*) ;