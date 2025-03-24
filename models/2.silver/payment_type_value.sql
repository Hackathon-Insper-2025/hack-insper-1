SELECT 
    payment_type,
    payment_value
FROM 
    {{ref('order_payments')}}
WHERE 
    payment_type != "not_defined"