SELECT
    p.product_category_name as category,
    oi.price as preco,
    oi.freight_value as frete
FROM {{ ref('products') }} as p
INNER JOIN {{ ref('order_items') }} as oi USING(product_id)
