SELECT 
  artistas.nome AS artista,
  albuns.album_nome AS album
  FROM SpotifyClone.albuns AS albuns
  JOIN SpotifyClone.artistas AS artistas
  ON albuns.artista_id = artistas.id
  AND artistas.nome = 'Walter Phoenix';
