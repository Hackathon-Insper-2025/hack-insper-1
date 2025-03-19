CREATE VIEW orders_evolucao AS
    SELECT 
        LEFT(order_purchase_timestamp, 7) AS order_date,
        COUNT(DISTINCT order_id) AS total_orders
    FROM {{ ref('orders_notempo') }} as o
    GROUP BY order_date
    ORDER BY order_date
