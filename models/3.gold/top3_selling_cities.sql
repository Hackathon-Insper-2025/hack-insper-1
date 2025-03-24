SELECT 
    CASE 
        WHEN customer_city = 'sao paulo' THEN 'São Paulo'
        WHEN customer_city = 'rio de janeiro' THEN 'Rio de Janeiro'
        WHEN customer_city = 'belo horizonte' THEN 'Belo Horizonte'
        ELSE customer_city
    END AS cliente_cidade,
    COUNT(DISTINCT(o.order_id)) total_pedidos
FROM 
    {{ ref('orders') }} o
INNER JOIN 
    {{ ref('customers') }} c USING (customer_id)
GROUP BY 
    cliente_cidade
ORDER BY 
    total_pedidos DESC
LIMIT 3