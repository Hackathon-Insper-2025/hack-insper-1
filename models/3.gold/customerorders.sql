SELECT
  *,
  CASE 
    WHEN ticket_medio < 100 THEN 'Baixo (<100)'
    WHEN ticket_medio BETWEEN 100 AND 300 THEN 'Médio (100-300)'
    ELSE 'Alto (>300)'
  END AS faixa_ticket
FROM (
  SELECT
    customer_unique_id AS cliente,
    COUNT(order_id) AS pedidos_clientes,
    ROUND(SUM(price), 2) AS total_gasto_cliente,
    ROUND(SUM(price) / COUNT(order_id), 2) AS ticket_medio
  FROM {{ ref('fat_category') }}
  WHERE customer_unique_id IS NOT NULL
  GROUP BY customer_unique_id
) AS sub
