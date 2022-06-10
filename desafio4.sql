SELECT nome AS usuario, IF (
  MAX(YEAR(historico.data_reprodução)) = 2021, 'Usuário ativo', 'Usuário inativo')
  AS condicao_usuario
  FROM SpotifyClone.historico historico
  JOIN SpotifyClone.usuarios usuarios
  ON historico.usuario_id = usuarios.id
  GROUP BY usuarios.id
  ORDER BY usuario ASC;