SELECT 
  estado,
  ROUND(SUM(total_gasto), 2) AS total_gasto_estado,
  latitude,
  longitude 
FROM {{ ref('gasto_customer') }}
GROUP BY estado