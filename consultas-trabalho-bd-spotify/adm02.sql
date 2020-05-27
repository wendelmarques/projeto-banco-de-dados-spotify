-- ADM-02) Qual a quantidade total de playlists que um determinado artista foi adicionado? 


SELECT nome_artistico AS Artista, count(*) AS 'Numero de playlists'
FROM artista  
	INNER JOIN (compos 
                    	INNER JOIN (musica 
                                	INNER JOIN (possui
                                           	INNER JOIN playlist 
                                           	ON possui.possui_cod_playlist = playlist.cod_playlist)
                                	ON possui.possui_mus_id = musica.id)
                    	ON compos.id_musica_compos = musica.id)
        	ON artista.id_user_artista = compos.id_artista_compos 
WHERE 'Post Malone' = nome_artistico;