SELECT 
  c.customer_unique_id,
  c.customer_id,
  c.customer_state as estado,
  c.customer_zip_code_prefix,
  AVG(g.geolocation_lat) AS latitude,
  AVG(g.geolocation_lng) AS longitude,
  SUM(oi.price) AS total_gasto
FROM {{ ref('customers') }} AS c
JOIN {{ ref('orders') }} AS o USING (customer_id)
JOIN {{ ref('order_items') }} AS oi USING (order_id)
JOIN {{ ref('geolocation') }} AS g 
  ON c.customer_zip_code_prefix = g.geolocation_zip_code_prefix
GROUP BY 
  c.customer_unique_id, 
  c.customer_id, 
  c.customer_state, 
  c.customer_zip_code_prefix
