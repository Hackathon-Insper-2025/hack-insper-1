SELECT 
  c.customer_unique_id,
  c.customer_id,
  c.customer_state,
  SUM(oi.price) AS total_gasto
FROM {{ ref('customers') }} AS c
JOIN {{ ref('orders') }} AS o USING (customer_id)
JOIN {{ ref('order_items') }} AS oi USING (order_id)
GROUP BY c.customer_unique_id, c.customer_id, c.customer_state