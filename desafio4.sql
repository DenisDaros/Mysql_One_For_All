SELECT a.usuario AS usuario,
IF(MAX(YEAR(b.data_reproducao)) >= 2021,'Usuário ativo', 'Usuário inativo') AS 'status_usuario'
FROM SpotifyClone.historico AS b
INNER JOIN SpotifyClone.usuario AS a ON a.id_usuario = b.id_usuario
GROUP BY usuario
ORDER BY usuario;