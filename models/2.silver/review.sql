SELECT 
    review_id, 
    review_score, 
    review_comment_message
FROM 
    {{ ref('order_reviews') }}
WHERE 
    review_comment_message != ""