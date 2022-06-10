SELECT
	musicas.nome AS cancao,
    COUNT(historico.musica_id) AS reproducoes
    FROM SpotifyClone.historico AS historico
    JOIN SpotifyClone.musicas AS musicas
    ON historico.musica_id = musicas.id
    GROUP BY musica_id
    ORDER BY reproducoes DESC, cancao ASC
    LIMIT 2;