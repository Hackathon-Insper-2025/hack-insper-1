SELECT
    p.product_category_name as category,
    oi.price as preco,
    oi.freight_value as frete
FROM {{ ref('products') }} AS p
    INNER JOIN {{ ref('order_items') }} AS oi USING(product_id)
WHERE p.product_category_name IS NOT NULL
    AND TRIM(p.product_category_name) <> ''
