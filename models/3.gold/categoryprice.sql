SELECT 
    category,
    ROUND(SUM(preco + frete), 2) AS total_price
FROM {{ ref('fat_category') }}
WHERE category IS NOT NULL AND TRIM(category) <> ''
GROUP BY category
