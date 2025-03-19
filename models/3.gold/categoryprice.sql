SELECT 
    category,
    SUM(preco + frete) AS total_price
FROM {{ ref('fat_category') }} as fc
GROUP BY category
ORDER BY total_price DESC
