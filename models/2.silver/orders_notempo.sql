SELECT 
    o.order_status,
    o.order_id,
    o.customer_id,
    oi.order_item_id,
    o.order_purchase_timestamp,
    oi.price
FROM {{ ref('orders') }} as o
    INNER JOIN {{ref('order_items')}} as oi USING(order_id)