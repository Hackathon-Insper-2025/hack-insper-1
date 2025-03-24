SELECT 
    payment_type AS forma_pagamento,
    payment_value AS valor_compra
FROM 
    {{ref('order_payments')}}
WHERE 
    payment_type != "not_defined"