WITH palavras_tokenizadas AS (
    SELECT 
    LOWER(TRIM(word)) AS palavra,
    review_score
    FROM {{ ref('review') }},
    UNNEST(SPLIT(review_comment_message, ' ')) AS word
    WHERE review_comment_message IS NOT NULL
)

SELECT 
    palavra,
    COUNT(*) AS ocorrencias,
    ROUND(AVG(review_score), 2) AS media_nota
FROM palavras_tokenizadas
WHERE palavra NOT IN ('o', 'a', 'e', 'de', 'do', 'da', 'que', 'em', 'é', '.', ',', '-', '', 'para', 'por', 'com', 'na', 'no', 'os', 'as')
    AND LENGTH(palavra) > 2
GROUP BY palavra
ORDER BY ocorrencias DESC
