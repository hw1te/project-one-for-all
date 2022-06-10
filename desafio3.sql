SELECT 
	usuarios.nome AS usuario,
	COUNT(historico.musica_id) AS qtde_musicas_ouvidas,
 	ROUND(SUM(musicas.duracao_segundos)/60,2) AS total_minutos
FROM usuarios
JOIN historico
ON usuarios.id = historico.usuario_id
JOIN musicas
ON historico.musica_id = musicas.id
GROUP BY usuarios.id
ORDER BY usuarios.nome