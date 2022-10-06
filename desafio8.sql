SELECT b.nome_artista AS artista, a.nome_album AS album 
FROM SpotifyClone.album AS a
INNER JOIN SpotifyClone.artista AS b
ON b.id_artista = a.id_artista AND b.nome_artista = "Elis Regina";