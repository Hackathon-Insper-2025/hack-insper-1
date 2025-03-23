SELECT 
  customer_state AS estado,
  ROUND(SUM(total_gasto), 2) AS total_gasto_estado
FROM {{ ref('gasto_customer') }}
GROUP BY customer_state
ORDER BY total_gasto_estado DESC