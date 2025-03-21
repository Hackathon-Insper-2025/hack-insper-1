SELECT 
    g.geolocation_lat, 
    g.geolocation_lng, 
    g.geolocation_city, 
    g.geolocation_state,
    c.customer_state,
    regexp_extract(c.customer_id,r'^.{0,3}') AS customer_id,
    regexp_extract(s.seller_id,r'^.{0,2}') as seller_id
FROM {{ ref('geolocation') }} AS g
    INNER JOIN {{ ref('customers') }} AS c ON g.geolocation_state = c.customer_state
    INNER JOIN {{ ref('sellers') }} AS s on g.geolocation_state = s.seller_state

    