SELECT
    review_score as nota_review,
    
    CASE 
        WHEN timestamp(NULLIF(order_delivered_customer_date, '')) > timestamp(NULLIF(order_estimated_delivery_date, '')) THEN 'Atrasado'
        ELSE 'No prazo'
    END AS status_entrega,
    
    COUNT(*) AS total_reviews
    
FROM {{ ref('fat_category') }} 
    
GROUP BY review_score, status_entrega
ORDER BY review_score DESC, status_entrega

