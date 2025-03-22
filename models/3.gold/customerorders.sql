SELECT 
    customer_id as cliente,
    COUNT(order_id) as pedidos_clientes,
    ROUND(SUM(price),2) as total_gasto_cliente
FROM {{ ref('fat_category') }} as fc
GROUP BY customer_id
HAVING customer_id IS NOT NULL
ORDER BY pedidos_clientes DESC