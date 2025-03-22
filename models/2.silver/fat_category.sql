SELECT
    p.product_category_name,
    oi.price,
    p.product_id,
    p.product_description_lenght,
    oi.freight_value,
    p.product_weight_g,
    oi.order_id,
    p.product_photos_qty,
    o.order_purchase_timestamp,
    o.order_delivered_customer_date,
    order_estimated_delivery_date,
    ore.review_score,
    regexp_extract(customer_id,r'^.{0,3}') as customer_id
FROM {{ ref('products') }} AS p
    INNER JOIN {{ ref('order_items') }} AS oi USING(product_id)
    INNER JOIN {{ ref('orders') }} AS o USING(order_id)
    INNER JOIN {{ref('order_reviews')}} as ore USING(order_id)
    INNER JOIN {{ref('customers')}} as c USING(customer_id)