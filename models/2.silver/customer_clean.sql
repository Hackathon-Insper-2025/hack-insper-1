SELECT 
    COUNT(customer_id) as num, 
    customer_unique_id
FROM {{ ref('customers') }}
GROUP BY customer_unique_id
ORDER BY num DESC