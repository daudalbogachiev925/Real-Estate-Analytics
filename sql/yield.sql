-- Доходность аренды
SELECT p.id,
    p.price AS purchase,
    AVG(r.monthly) * 12 AS annual_rent,
    ROUND(100.0 * AVG(r.monthly) * 12 / p.price, 2) AS yield_pct
FROM properties p
JOIN rentals r ON r.property_id = p.id
GROUP BY p.id
ORDER BY yield_pct DESC;
