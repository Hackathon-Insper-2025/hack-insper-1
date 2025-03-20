SELECT 
    product_category_name AS category, 
    COUNT(order_id) AS total_sold,

FROM {{ ref('fat_category') }} 
WHERE order_delivered_customer_date IS NOT NULL  
GROUP BY product_category_name

HAVING category IS NOT NULL AND TRIM(category) <> ''
ORDER BY total_sold DESC




