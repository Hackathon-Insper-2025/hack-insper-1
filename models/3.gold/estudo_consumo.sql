SELECT DISTINCT
    c.customer_state,
    other_p.product_category_name AS outras_categorias,
    COUNT(DISTINCT other_oi.order_id) AS qtde_pedidos_outras_categorias
FROM 
    {{ ref('customers') }} AS c
INNER JOIN 
    {{ ref('orders') }} AS o USING (customer_id)
INNER JOIN 
    {{ ref('order_items') }} AS oi USING (order_id)
INNER JOIN 
    {{ ref('products') }} AS p USING (product_id)
INNER JOIN 
    {{ ref('order_items') }} AS other_oi ON other_oi.order_id = o.order_id
INNER JOIN 
    {{ ref('products') }} AS other_p ON other_p.product_id = other_oi.product_id
WHERE 
    o.order_status = 'delivered'
    AND
    c.customer_state = 'SP'
    AND 
    (o.order_delivered_customer_date >= "2017-01-01" 
    AND 
    o.order_delivered_customer_date < "2017-12-01")
    AND 
    p.product_category_name = 'cama_mesa_banho'
    AND 
    other_p.product_category_name != 'cama_mesa_banho'
GROUP BY 
    c.customer_state, other_p.product_category_name
ORDER BY 
    c.customer_state DESC, qtde_pedidos_outras_categorias DESC
LIMIT 3