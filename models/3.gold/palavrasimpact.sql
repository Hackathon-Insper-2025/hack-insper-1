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
WHERE palavra NOT IN (
    'o', 'a', 'e', 'de', 'do', 'da', 'que', 'em', 'é', '.', ',', '-', '',
    'para', 'por', 'com', 'na', 'no', 'nos', 'nas', 'os', 'as',
    'um', 'uma', 'uns', 'umas', 'ao', 'aos', 'à', 'às',
    'dos', 'das', 'sobre', 'entre', 'desde', 'contra', 'perante',
    'mas', 'ou', 'se', 'então', 'como', 'porque', 'quando', 'pois',
    'ele', 'ela', 'eles', 'elas', 'isso', 'isto', 'aquilo',
    'meu', 'minha', 'meus', 'minhas', 'seu', 'sua', 'seus', 'suas',
    'dele', 'dela', 'deles', 'delas', 'nosso', 'nossa', 'nossos', 'nossas',
    'ser', 'estar', 'ter', 'fazer', 'haver', 'vai', 'vou', 'foi', 'são', 'era', 'sou', 'está', 'estavam',
    'muito', 'pouco', 'tudo', 'nada', 'todos', 'todas', 'algum', 'alguma', 'alguns', 'algumas',
    'mesmo', 'mesma', 'mesmos', 'mesmas',
    'assim', 'aqui', 'ali', 'lá', 'bem', 'mal', 'já', 'ainda',
    'tem', 'têm', 'tinha', 'tiveram', 'tivemos',
    'depois', 'antes', 'entretanto', 'também', 'então', 'tambem',
    'cada', 'qual', 'quem', 'cujo', 'cuja', 'cujos', 'cujas',
    'onde', 'quando', 'seja', 'for', 'estava',
    'nesse', 'neste', 'naquele', 'deste', 'dessa', 'disso', 'nisso', 'nele', 'nela', 'neles', 'nelas'
)
AND LENGTH(palavra) > 2
GROUP BY palavra
ORDER BY ocorrencias DESC
