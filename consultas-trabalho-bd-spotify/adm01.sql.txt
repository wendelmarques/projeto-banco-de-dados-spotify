-- ADM-01) Quando um determinado ouvinte escutou uma musica X?

SELECT tipo_conta AS 'ASSINATURA', nome, titulo AS 'MUSICA', data AS 'DIA', hora AS 'HORA'
FROM usuario
       	 INNER JOIN (ouvinte
                    	INNER JOIN (escuta
                                	INNER JOIN musica
                                	ON escuta.mus_id = musica.id)
                    	ON escuta.id_ouvinte_escuta = ouvinte.id_user_ouvinte)
	    ON usuario.id_usuario = ouvinte.id_user_ouvinte
 WHERE 'Arthur Gomes' = nome AND 'T.N.T'= titulo
 GROUP BY tipo_conta, nome, titulo, data, hora;


