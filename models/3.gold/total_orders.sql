SELECT DISTINCT
    COUNT(o.order_id) AS total_orders
FROM 
    {{ ref('orders') }} AS o