SELECT 
    product_category_name as category,
    SUM(price + freight_value) AS total_price
FROM {{ ref('fat_category') }} as fc
GROUP BY category
HAVING category IS NOT NULL AND TRIM(category) <> ''
ORDER BY total_price DESC
