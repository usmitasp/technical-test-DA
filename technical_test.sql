WITH monthly_product_sales AS (
    SELECT 
        FORMAT_TIMESTAMP('%Y-%m', o.created_at) AS order_month,
        p.id AS product_id,
        p.name AS product_name,
        SUM(oi.sale_price * o.num_of_item) AS total_sales,
        SUM(o.num_of_item) AS total_quantity
    FROM 
        `bigquery-public-data.thelook_ecommerce.orders` AS o
    LEFT JOIN 
        `bigquery-public-data.thelook_ecommerce.order_items` AS oi
        ON o.order_id = oi.order_id
    LEFT JOIN 
        `bigquery-public-data.thelook_ecommerce.products` AS p
        ON oi.product_id = p.id
    WHERE 
        o.created_at IS NOT NULL
    GROUP BY 
        order_month, p.id, p.name
)

SELECT 
    *,
    RANK() OVER (PARTITION BY order_month ORDER BY total_sales DESC) AS rank_by_sales

FROM monthly_product_sales

