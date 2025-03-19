SELECT *
FROM {{ source('dex-dsm-production-dex_landing', 'base_g1__postgres_ecommerce_db_products') }}
WHERE product_name_lenght IS NOT NULL