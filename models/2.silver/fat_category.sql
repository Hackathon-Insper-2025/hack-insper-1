SELECT
    p.product_category_name,
    oi.price,
    oi.freight_value
FROM {{ ref('products') }} AS p
    INNER JOIN {{ ref('order_items') }} AS oi USING(product_id)

