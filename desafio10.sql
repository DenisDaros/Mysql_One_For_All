SELECT c.cancoes_nome AS nome,
COUNT(a.data_reproducao) AS reproducoes
FROM SpotifyClone.historico AS a
INNER JOIN SpotifyClone.usuario AS b
ON b.id_usuario = a.id_usuario
INNER JOIN SpotifyClone.cancoes AS c
ON c.id_cancoes = a.id_cancoes 
WHERE b.id_plano = 1 OR b.id_plano = 4
GROUP BY cancoes_nome
ORDER BY cancoes_nome;