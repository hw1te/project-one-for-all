SELECT 
	COUNT(*) quantidade_musicas_no_historico
	FROM SpotifyClone.usuarios AS usuarios
	JOIN SpotifyClone.historico AS historico
	ON historico.usuario_id = usuarios.id
	WHERE usuarios.nome LIKE "Bill%";