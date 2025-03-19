SELECT 
    customer_zip_code_prefix, 
    regexp_extract(customer_id,r'^.{0,3}') as customer_id, 
    customer_unique_id, customer_city, customer_state
FROM {{ ref('customers') }}