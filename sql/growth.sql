-- Рост цен по кварталам
SELECT district,
    date_trunc('quarter', sold_at) AS q,
    AVG(price) AS avg_price,
    AVG(price) - LAG(AVG(price)) OVER (PARTITION BY district ORDER BY date_trunc('quarter', sold_at)) AS diff
FROM deals
GROUP BY district, q
ORDER BY district, q;
