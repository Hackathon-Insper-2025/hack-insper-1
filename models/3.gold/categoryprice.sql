SELECT *
FROM {{ ref('fat_category') }}
WHERE category IS NOT NULL AND TRIM(category) <> ''
