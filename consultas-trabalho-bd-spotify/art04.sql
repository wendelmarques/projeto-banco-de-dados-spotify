-- ART-04) Quais as músicas possuem participação de um artista A?

SELECT  titulo AS 'MUSICA', nome_artistico  'ARTISTA' 
FROM musica 
        	INNER JOIN (album
        	        	INNER JOIN artista 
        	        	ON album.idartAlb= artista.id_user_artista)
	        	ON album.nome_album = musica.Nome_albumMus 
WHERE 'Chris' = nome_artistico
GROUP BY titulo, nome_artistico;