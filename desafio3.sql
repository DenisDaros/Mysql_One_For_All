SELECT a.usuario AS usuario,
COUNT(b.id_cancoes) AS qt_de_musicas_ouvidas,
ROUND(SUM(c.duracao_cancao)/60 ,2) AS total_minutos
FROM
SpotifyClone.usuario AS a
INNER JOIN 
SpotifyClone.historico AS b
ON 
a.id_usuario = b.id_usuario
INNER JOIN 
SpotifyClone.cancoes AS c
ON
 b.id_cancoes = c.id_cancoes
GROUP BY a.usuario
ORDER BY a.usuario;
