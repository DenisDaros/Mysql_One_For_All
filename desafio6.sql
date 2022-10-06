SELECT 
MIN(a.valor_plano) AS faturamento_minimo,
MAX(a.valor_plano) AS faturamento_maximo,
ROUND(AVG(a.valor_plano), 2) AS faturamento_medio,
SUM(a.valor_plano) AS faturamento_total
FROM SpotifyClone.plano AS a
INNER JOIN SpotifyClone.usuario AS b
ON a.id_plano = b.id_plano;