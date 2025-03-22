SELECT 
    customer_unique_id as cliente,
    COUNT(order_id) as pedidos_clientes,
    ROUND(SUM(price),2) as total_gasto_cliente,
    ROUND(SUM(price) / (COUNT(order_id)), 2) AS ticket_medio
    
FROM {{ ref('fat_category') }} as fc
WHERE customer_unique_id IS NOT NULL
GROUP BY customer_unique_id
ORDER BY pedidos_clientes DESC