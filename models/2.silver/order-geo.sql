SELECT 
    c.customer_state,
    regexp_extract(c.customer_id,r'^.{0,3}') AS customer_id,
    regexp_extract(s.seller_id,r'^.{0,2}') as seller_id,
    oi.order_id
FROM {{ ref('orders') }} AS o
    INNER JOIN {{ ref('customers') }} AS c USING(customer_id)
    INNER JOIN {{ ref('order_items') }} AS oi USING(order_id)
    INNER JOIN {{ ref('sellers') }} AS s USING(seller_id)

    