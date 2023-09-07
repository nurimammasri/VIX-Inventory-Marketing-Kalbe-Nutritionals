-- DATASETS AND DESCRIPTION
-- Legend:

-- This dataset consists of 4 CSV files: customer, store, product, and transaction. It serves as dummy data for a Fast-Moving Consumer Goods (FMCG) case study covering a one-year period, collected through a membership program.

-- Explanation:
-- 1. Customer
-- - CustomerID: Unique Customer ID
-- - Age: Customer's age
-- - Gender: 0 for Female, 1 for Male
-- - Marital Status: Married, Single (Not married/Previously married)
-- - Income: Monthly income in million rupiahs

-- 2. Store
-- - StoreID: Unique Store Code
-- - StoreName: Store Name
-- - GroupStore: Group Name
-- - Type: Modern Trade, General Trade
-- - Latitude: Latitude code
-- - Longitude: Longitude code

-- 3. Product
-- - ProductID: Unique Product Code
-- - Product Name: Product Name
-- - Price: Price in Indonesian rupiahs

-- 4. Transaction
-- - TransactionID: Unique Transaction Code
-- - Date: Transaction date
-- - Qty: Quantity of items purchased
-- - Total Amount: Price x Qty


-- PROBLEM CASES

-- Query 1
-- What is the average age of customers when viewed based on their marital status?
SELECT 
	marital_status,
	round(avg(age), 2)  AS avg_age
FROM customer c 
--WHERE marital_status != ''
GROUP BY 1;

-- Conclusion: The average age of married customers is approximately 43 years, 
-- while single customers have an average age of 29 years. For empty/null data, 
-- which provides no marital status information, the average age is approximately 
-- 31 years. Therefore, it can be concluded that married customers are, on average, 
-- older than single ones.


-- Query 2
-- What is the average age of customers based on their gender?
SELECT 
	CASE WHEN gender = 0 THEN 'Wanita'
	WHEN gender = 1 THEN 'Pria'
	ELSE 'None' END AS gender,
	round(avg(age), 2)  AS avg_age
FROM customer c 
GROUP BY 1;

-- Conclusion: The average age of female customers is 40 years, while for male 
-- customers, it is 39 years. There is not a significant age difference between 
-- the two genders.


-- Query 3
-- Determine the store name with the highest total quantity of products sold!
SELECT 
	s.store_name,
	sum(qty) AS sum_qty
FROM transaction t 
JOIN store s 
ON t.store_id = s.store_id 
GROUP BY 1
ORDER BY 2 DESC 
LIMIT 1;

-- Conclusion: Among the 12 stores, the top 5 stores are Lingga, Sinar Harapan, 
-- Prestasi Utama, Prima Kota, and Buana. The store with the highest quantity of 
-- products sold is Lingga Store, with a total purchase quantity of 2,777 products.


-- Query 4
-- Determine the best-selling product by total amount!
SELECT 
	p.product_name,
	sum(total_amount) AS total_amount 
FROM transaction t 
JOIN product p 
ON t.product_id = p.product_id 
GROUP BY 1
ORDER BY 2 DESC 
LIMIT 1;

-- Conclusion: Among the 10 products, the top 5 products are Cheese Stick, 
-- Choco Bar, Coffee Candy, Yoghurt, and Oat. The product with the highest 
-- total sales amount is Cheese Stick, with a total sales amount of 27 million rupiahs.

