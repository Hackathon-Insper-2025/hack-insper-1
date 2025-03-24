SELECT 
    COUNT(DISTINCT(o.order_id)) AS total_orders
FROM 
    {{ ref('orders') }} AS o