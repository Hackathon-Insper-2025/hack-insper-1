SELECT 
    payment_type AS forma_pagamento,
    ROUND(AVG(payment_value),2) AS valor_medio_compra
FROM 
    {{ ref('payment_type_value') }}
GROUP BY 
    payment_type
ORDER BY 
    valor_medio_compra DESC