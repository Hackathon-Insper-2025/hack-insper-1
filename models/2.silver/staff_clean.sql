SELECT DISTINCT
    regexp_extract(s.seller_id,r'^.{0,2}') as seller_id,
    seller_zip_code_prefix,
    seller_state
FROM
    {{ ref('sellers') }} s
ORDER BY seller_state