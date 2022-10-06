SELECT a.nome_artista AS artista, 
b.nome_album AS album, 
COUNT(c.id_usuario) AS seguidores 
FROM SpotifyClone.artista AS a
INNER JOIN SpotifyClone.album AS b
ON a.id_artista = b.id_artista
INNER JOIN SpotifyClone.seguindo AS c
ON a.id_artista = c.id_artista
GROUP BY b.nome_album, a.nome_artista
ORDER BY seguidores DESC , artista ASC , album ASC;