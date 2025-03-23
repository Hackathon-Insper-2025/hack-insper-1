SELECT 
  estado,
  ROUND(SUM(total_gasto), 2) AS total_gasto_estado,
  AVG(latitude) AS latitude,
  AVG(longitude) AS longitude
FROM {{ ref('gasto_customer') }}
GROUP BY customer_state
