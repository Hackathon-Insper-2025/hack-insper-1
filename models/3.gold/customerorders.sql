SELECT 
    customer_id as cliente,
    COUNT(order_id) as pedidos_clientes
FROM {{ ref('fat_category') }} as fc
GROUP BY customer_id
WHERE review_score = 1
HAVING customer_id IS NOT NULL AND TRIM(customer_id) <> ''
ORDER BY pedidos_clientes DESC