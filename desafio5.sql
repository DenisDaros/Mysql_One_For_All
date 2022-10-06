SELECT a.cancoes_nome AS cancao, 
COUNT(b.id_cancoes) AS reproducoes
FROM SpotifyClone.cancoes AS a
INNER JOIN SpotifyClone.historico AS b
ON a.id_cancoes = b.id_cancoes
GROUP BY cancao
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;