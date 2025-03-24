SELECT 
  estado,
  ROUND(SUM(total_gasto), 2) AS total_gasto_estado,
  COUNT(customer_unique_id) AS total_pedidos,
  ROUND(SUM(total_gasto) / COUNT(customer_unique_id), 2) AS ticket_medio_estado,
  ROUND(AVG(latitude), 6) AS latitude,
  ROUND(AVG(longitude), 6) AS longitude
FROM {{ ref('gasto_customer') }}
GROUP BY estado
