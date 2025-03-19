SELECT
    p.product_category_name,
    oi.price,
    oi.freight_value
FROM {{ ref('products') }} AS p
INNER JOIN {{ ref('order_items') }} AS oi USING(product_id)
WHERE p.product_category_name IS NOT NULL
    AND TRIM(p.product_category_name) <> ''
