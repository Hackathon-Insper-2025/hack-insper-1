SELECT 
    product_category_name AS category,
    ROUND(SUM(price + freight_value), 2) AS total_price
FROM {{ ref('fat_category') }} as fc
GROUP BY category
ORDER BY total_price DESC
