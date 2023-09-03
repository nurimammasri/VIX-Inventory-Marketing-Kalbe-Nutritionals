-- DATASETS AND DESCRIPTION
--	Case Study - Legend :

--	Dataset ini terdiri dari 4 csv file yaitu customer, store, product dan transaction. Merupakan dummy data untuk studi kasus FMCG dalam kurun waktu 1 tahun yang diambil melalui program membership.

--	Penjelasan 
--	1. Customer
--	- CustomerID : No Unik Customer
--	- Age : Usia Customer
--	- Gender : 0 Wanita, 1 Pria
--	- Marital Status : Married, Single (Blm menikah/Pernah menikah)
--	- Income : Pendapatan per bulan dalam jutaan rupiah

--	2. Store
--	- StoreID : Kode Unik Store
--	- StoreName : Nama Toko
--	- GroupStore : Nama group
--	- Type : Modern Trade, General Trade
--	- Latitude : Kode Latitude
--	- Longitude : Kode Longitude

--	3. Product
--	- ProductID : Kode Unik Product
--	- Product Name : Nama Product
--	- Price : Harga dlm rupiah

--	4. Transaction
--	- TransactionID : Kode Unik Transaksi
--	- Date : Tanggal transaksi
--	- Qty : Jumlah item yang dibeli
--	- Total Amount : Price x Qty


-- PROBLEM CASES

-- Query 1
--	Berapa rata-rata umur customer jika dilihat dari marital statusnya ? 
SELECT 
	marital_status,
	round(avg(age), 2)  AS avg_age
FROM customer c 
WHERE marital_status != ''
GROUP BY 1;

-- Query 2
--	Berapa rata-rata umur customer jika dilihat dari gender nya ? 
SELECT 
	CASE WHEN gender = 0 THEN 'Wanita'
	WHEN gender = 1 THEN 'Pria'
	ELSE 'None' END AS gender,
	round(avg(age), 2)  AS avg_age
FROM customer c 
GROUP BY 1;

-- Query 3
--	Tentukan nama store dengan total quantity terbanyak! 
SELECT 
	s.store_name,
	sum(qty) AS sum_qty
FROM transaction t 
JOIN store s 
ON t.store_id = s.store_id 
GROUP BY 1
ORDER BY 2 DESC 
LIMIT 1;

-- Query 4
--	Tentukan nama produk terlaris dengan total amount terbanyak!
SELECT 
	p.product_name,
	sum(total_amount) AS total_amount 
FROM transaction t 
JOIN product p 
ON t.product_id = p.product_id 
GROUP BY 1
ORDER BY 2 DESC 
LIMIT 1;