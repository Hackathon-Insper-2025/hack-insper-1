SELECT
    p.product_category_name as category,
    ROUND(SUM(oi.price + oi.freight_value), 2) AS total_price
FROM {{ ref('products') }} as p
INNER JOIN {{ ref('order_items') }} as oi USING(product_id)
