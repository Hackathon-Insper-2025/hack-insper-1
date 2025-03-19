SELECT
    p.product_category_name AS category,
    oi.price as preco,
    oi.freight_value as frete
FROM {{ ref('products') }} AS
INNER JOIN {{ ref('order_items') }}AS oi USING(product_id)
