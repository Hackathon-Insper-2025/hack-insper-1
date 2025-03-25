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

  -- Verbos auxiliares e comuns
  'ser', 'estar', 'ter', 'fazer', 'haver', 'vai', 'vou', 'foi', 'são', 
  'era', 'sou', 'está', 'estavam', 'tem', 'têm', 'tinha', 'tiveram', 'tivemos',
  'fica', 'ficou', 'ficam', 'ficaria', 'fica', 'ficou', 'fica', 'deve', 'deveria', 'pode',

  -- Palavras vagas
  'muito', 'pouco', 'tudo', 'nada', 'todos', 'todas', 'algum', 'alguma', 'alguns', 'algumas',
  'mesmo', 'mesma', 'mesmos', 'mesmas', 'ainda', 'bem', 'mal', 'já', 'sim', 'não', 'também', 'tambem',

  -- Advérbios e conectores
  'assim', 'aqui', 'ali', 'lá', 'lá', 'além', 'cá', 'daqui', 'dali', 'onde', 'aonde', 'depois', 'antes',
  'entretanto', 'entao', 'então', 'logo', 'portanto', 'porém', 'contudo',

  -- Pronomes indefinidos
  'cada', 'qual', 'quem', 'cujo', 'cuja', 'cujos', 'cujas',
  'este', 'esta', 'estes', 'estas', 'esse', 'essa', 'esses', 'essas',
  'aquele', 'aquela', 'aqueles', 'aquelas',

  -- Preposições compostas
  'nesse', 'neste', 'naquele', 'deste', 'dessa', 'disso', 'nisso', 'nele', 'nela', 'neles', 'nelas',

  -- Palavras comuns irrelevantes
  'ok', 'sim', 'nao', 'legal', 'favor', 'obrigado', 'obrigada', 'valeu', 'att', 'bom', 'boa', 'dia', 'noite', 'tarde'
)

AND LENGTH(palavra) > 2
GROUP BY palavra
ORDER BY ocorrencias DESC
