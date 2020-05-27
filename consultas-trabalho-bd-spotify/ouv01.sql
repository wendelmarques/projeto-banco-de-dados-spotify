-- OUV-01) Lista dos álbuns do gênero Y lançados no período X.

SELECT  nome_album AS 'ALBUM' 
FROM album
	INNER JOIN artista
           ON album.idartAlb = artista.id_user_artista  
 WHERE 'Pop' = genero_musical  AND data_lancamento LIKE '20%';