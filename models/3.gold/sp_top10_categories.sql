SELECT DISTINCT
    c.customer_state,
    p.product_category_name,
    COUNT(DISTINCT o.order_id) AS qtde_pedidos_categoria
FROM 
    {{ ref('customers') }} AS c
INNER JOIN 
    {{ ref('orders') }} AS o USING (customer_id)
INNER JOIN 
    {{ ref('order_items') }} AS oi USING (order_id)
INNER JOIN 
    {{ ref('products') }} AS p USING (product_id)
WHERE 
    o.order_status = 'delivered' 
    AND
    c.customer_state = 'SP'
    AND 
    (o.order_delivered_customer_date >= "2017-01-01" 
    AND 
    o.order_delivered_customer_date < "2017-12-01")
GROUP BY 
    c.customer_state, p.product_category_name
ORDER BY 
    c.customer_state DESC, qtde_pedidos_categoria DESC 
LIMIT 10