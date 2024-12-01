-- Membuat CTE bernama 'report_monthly_orders_product_agg'
-- CTE ini bertujuan untuk menghitung total penjualan masing-masing produk tiap bulannya.
WITH report_monthly_orders_product_agg AS (
    SELECT -- Mengambil kolom yang ditentukan dari beberapa file csv
        FORMAT_TIMESTAMP('%Y-%m', o.created_at) AS order_month,
        p.id AS product_id,
        p.name AS product_name,
        SUM(oi.sale_price * o.num_of_item) AS total_sales, -- menghitung total penjualan
        SUM(o.num_of_item) AS total_quantity -- menghitung banyaknya produk terjual
    FROM 
        `bigquery-public-data.thelook_ecommerce.orders` AS o -- mengambil data order
    LEFT JOIN 
        `bigquery-public-data.thelook_ecommerce.order_items` AS oi -- mengambil data order items
        ON o.order_id = oi.order_id
    LEFT JOIN 
        `bigquery-public-data.thelook_ecommerce.products` AS p -- mengambil data produk
        ON oi.product_id = p.id
    WHERE 
        o.created_at IS NOT NULL --memastikan bahwa kolom tidak memiliki nilai null
    GROUP BY 
        order_month, p.id, p.name
)

SELECT -- mengambil semua kolom dari tabel 'report_monthly_orders_product_agg'
    *,
    RANK() OVER (PARTITION BY order_month ORDER BY total_sales DESC) AS rank_by_sales -- mengurutkan data berdasarkan total penjualan

FROM report_monthly_orders_product_agg

