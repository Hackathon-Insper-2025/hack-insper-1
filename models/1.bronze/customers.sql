SELECT DISTINCT customer_id, customer_unique_id
FROM {{source('dex-dsm-production-dex_landing', 'base_g1__postgres_ecommerce_db_customers')}}