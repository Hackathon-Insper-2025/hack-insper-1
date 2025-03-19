select *
from {{ source('dex-dsm-production-dex_landing', 'base_g1__postgres_ecommerce_db_order_reviews') }}