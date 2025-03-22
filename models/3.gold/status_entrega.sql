SELECT
    CASE 
        WHEN timestamp(NULLIF(order_delivered_customer_date, '')) > timestamp(NULLIF(order_estimated_delivery_date, '')) 
        THEN 'Atrasado'
        ELSE 'No prazo'
    END AS status_entrega,
    
    SUM(review_score) AS soma_notas,
    COUNT(*) AS qtde_reviews,
    ROUND(SUM(review_score)/ COUNT(*), 2) AS media_ponderada

FROM {{ ref('fat_category') }}
WHERE order_delivered_customer_date IS NOT NULL 
    AND order_estimated_delivery_date IS NOT NULL
GROUP BY status_entrega
ORDER BY status_entrega
