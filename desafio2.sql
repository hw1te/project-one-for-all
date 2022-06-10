SELECT
	(SELECT COUNT(*) FROM SpotifyClone.musicas) AS 'cancoes',
	(SELECT COUNT(*) from SpotifyClone.artistas) AS 'artistas',
  (SELECT COUNT(*) from SpotifyClone.albuns) AS 'albuns';