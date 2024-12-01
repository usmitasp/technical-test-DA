# Penjelasan technical-test-DA

Full _code_ dan penjelasan lebih detail ada pada tautan [Technical Test](https://github.com/usmitasp/technical-test-DA/blob/e9e98f09bc9b6da5c8a53f1668d80b125fcbc37e/technical_test.sql)

Penjelasan:\
1. `WITH` : membuat CTE
2. `SELECT` : memilih kolom yang telah ditentukan
3. `AS` : memberikan alias atau penyingkatan nama kolom
4. `FROM` : mengakses semua data dari file csv yang dipilih
5. `LEFT JOIN` : menggabungkan dua file csv berbeda dengan tetap mempertahankan semua data dari tabel pertama.
6. `ON` : memilih pada kolom mana kedua file csv akan digabungkan
7. `WHERE` : menentukan filter pada baris pertama
8. `IS NOT NULL` : memeriksa bahwa kolom tidak berisi nilai NULL
9. `GROUP BY` : mengelompokkan data berdasarkan `order_month`, `p.id`, `p.name`
10. `ORDER BY` : mengurutkan data berdasarkan `total_sales`
11. `RANK() OVER` : mengurutkan produk berdasarkan pendapatan pejualan, dari terbesar hingga terkecil tiap bulannya.
12. `PARTITION BY` : membuat partisi data berdasarkan `order_month`
13. `DESC` : mengurutkan hasil dari terbesar hingga terkecil
