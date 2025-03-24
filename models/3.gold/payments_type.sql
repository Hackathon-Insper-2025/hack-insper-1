SELECT 
    CASE 
        WHEN payment_type = 'credit_card' THEN 'Crédito'
        WHEN payment_type = 'debit_card' THEN 'Débito'
        WHEN payment_type = 'boleto' THEN 'Boleto'
        WHEN payment_type = 'voucher' THEN 'Voucher'
        ELSE payment_type
    END AS forma_pagamento,
    ROUND(AVG(payment_value),2) AS valor_medio_compra
FROM 
    {{ ref('payment_type_value') }}
GROUP BY 
    payment_type
ORDER BY 
    valor_medio_compra DESC