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
WHERE palavra NOT IN 
    WHERE palavra NOT IN (
        'o', 'a', 'e', 'de', 'do', 'da', 'que', 'em', 'é', '.', ',', '-', '', 
        'para', 'por', 'com', 'na', 'no', 'os', 'as', 'um', 'uma', 'uns', 'umas', 
        'dos', 'das', 'sobre', 'entre', 'desde', 'contra', 'perante', 'mas', 'ou', 
        'se', 'então', 'como', 'porque', 'quando', 'pois', 'ele', 'ela', 'eles', 
        'elas', 'isso', 'isto', 'aquilo', 'meu', 'minha', 'seu', 'sua', 'dele', 
        'dela', 'nosso', 'nossa', 'ser', 'estar', 'ter', 'fazer', 'haver', 'vai', 
        'vou', 'foi', 'são', 'era', 'muito', 'pouco', 'tudo', 'nada', 'todos', 
        'todas', 'mesmo', 'assim', 'aqui', 'ali', 'lá'
    ) 
    AND LENGTH(palavra) > 2
GROUP BY palavra
ORDER BY ocorrencias DESC
