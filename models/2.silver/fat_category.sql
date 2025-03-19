SELECT
    p.product_category_name as category,
    ROUND(SUM(oi.price + oi.freight_value), 2) AS total_price
FROM {{ ref('products') }} as p
INNER JOIN {{ ref('order_items') }} as oi USING(product_id)
GROUP BY product_category_name
HAVING p.product_category_name IS NOT NULL
    AND TRIM(p.product_category_name) <> ''
