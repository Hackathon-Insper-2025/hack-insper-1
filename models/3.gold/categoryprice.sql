SELECT 
    product_category_name AS category,
    ROUND(SUM(price + freight_value), 2) AS total_price
FROM {{ ref('fat_category') }}
GROUP BY category
HAVING category IS NOT NULL AND TRIM(category) <> ''
