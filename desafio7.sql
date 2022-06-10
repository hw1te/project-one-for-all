SELECT
	artistas.nome AS artista,
    albuns.album_nome AS album,
    COUNT(seguindo.artista_id) seguidores
    FROM SpotifyClone.artistas artistas
    JOIN SpotifyClone.albuns albuns
    ON artistas.id = albuns.artista_id
    JOIN SpotifyClone.seguindo
    ON artistas.id = seguindo.artista_id
    GROUP BY albuns.album_nome, artistas.nome
    ORDER BY seguidores DESC, album ASC;
