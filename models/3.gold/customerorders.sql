SELECT
  *,
  CASE 
    WHEN ticket_medio < 50 THEN 'Baixo (<50)'
    WHEN ticket_medio BETWEEN 50 AND 300 THEN 'Médio (50-300)'
    ELSE 'Alto (>300)'
  END AS faixa_ticket
FROM (
  SELECT
    customer_unique_id AS cliente,
    COUNT(order_id) AS pedidos_clientes,
    ROUND(SUM(price + freight_value), 2) AS total_gasto_cliente,
    ROUND(SUM(price + freight_value) / COUNT(order_id), 2) AS ticket_medio
  FROM {{ ref('fat_category') }}
  WHERE customer_unique_id IS NOT NULL
  GROUP BY customer_unique_id
) AS sub
