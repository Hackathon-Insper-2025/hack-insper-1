SELECT
    o.order_status,
    ROUND(COUNT(o.order_id) * 100.0 / SUM(COUNT(o.order_id)) OVER (), 2) AS percentual_ocorrencia
FROM
    {{ ref('orders') }} AS o
GROUP BY
    o.order_status
ORDER BY
    percentual_ocorrencia DESC
LIMIT 6