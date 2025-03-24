SELECT 
    ROUND(AVG(r.review_score), 2) AS satifacao_media 
FROM 
    {{ ref('order_reviews') }} AS r