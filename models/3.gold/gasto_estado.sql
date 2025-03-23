SELECT 
    estado,
    ROUND(SUM(total_gasto), 2) AS total_gasto_estado,
    ROUND(AVG(latitude), 1) AS latitude,
    ROUND(AVG(longitude), 1) AS longitude,
FROM {{ ref('gasto_customer') }}
GROUP BY estado
