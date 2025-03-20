SELECT 
    product_category_name AS category, 
    COUNT(order_id) AS total_sold
FROM {{ ref('fat_category') }} 
WHERE order_delivered_customer_date IS NOT NULL and product_category_name IS NOT NULL AND TRIM(product_category_name) <> '' 
GROUP BY product_category_name
ORDER BY total_sold DESC




