--Display all columns from the customers table.
	SELECT * FROM customers;
--Show the first 10 rows from the orders table.
	SELECT * FROM orders
	LIMIT 10;
--Retrieve only the product_id, product_weight_g, and product_category_name from products.
	SELECT product_id, product_weight_g, product_category_name
	FROM products;
--List all seller_id and their respective seller_city from the sellers table.
	SELECT seller_id, seller_city 
	FROM sellers;
--Show all columns from order_reviews where review_score equals 5.
	SELECT * FROM order_reviews 
	WHERE review_score = 5.
--Display all payment_type values from the order_payments table.
	SELECT payment_type, payment_value FROM order_payments;
--Select distinct order_status values from the orders table.
	SELECT DISTINCT order_status FROM orders;
--Retrieve all columns from geolocation for the city 'São Paulo'.
	SELECT * FROM geolocation
	WHERE geolocation_citY = 'sao paulo';
--Show all columns from leads_qualified.
	SELECT * FROM leads_qualified
--Display all lead_type and business_segment from leads_closed.
	SELECT  lead_type, business_segment
	FROM leads_closed;

--2. WHERE Clause Practice
--Get all products that weigh more than 2000 grams.
	SELECT * FROM products WHERE product_weight_g > 2000;
--Find all orders with order_status = 'delivered'.
	SELECT * FROM orders 
	WHERE order_status = 'delivered';
--Show all sellers located in 'SP' (São Paulo state).
	SELECT * FROM sellers
	WHERE seller_state = 'SP';
--Retrieve all orders purchased after '2017-06-01'.
	SELECT * FROM orders 
	WHERE order_purchase_timestamp > '2017-06-01';
--Show reviews with review_score less than 3.
	SELECT * FROM order_reviews
	WHERE review_score < 3;
--Get all orders where order_estimated_delivery_date is before '2018-01-01'.
	SELECT * FROM orders 
	WHERE order_estimated_delivery_date < '2018-01-01';
--Find all customers who live in 'Rio de Janeiro'.
	SELECT * FROM customers
	WHERE customer_city = 'rio de janeiro';
--Show payments made using 'credit_card'.
	SELECT * FROM order_payments
	WHERE payment_type = 'credit_card';
--Get all leads from leads_closed where has_company = TRUE.
	SELECT * FROM leads_closed
	WHERE has_company = TRUE;
--Find all leads_closed where declared_monthly_revenue > 10000.
	SELECT * FROM leads_closed
	WHERE declared_monthly_revenue > 10000;

--3. GROUP BY + Aggregation
--Count how many customers exist in each customer_state.
	SELECT customer_state, COUNT(*) AS total_customers
    FROM customers
	GROUP BY customer_state
	ORDER BY total_customers DESC;
--Find the average payment_value for each payment_type.
	SELECT payment_type, AVG(payment_value) AS average_payment
	FROM order_payments
	GROUP BY payment_type
	ORDER BY average_payment DESC;
--Calculate total payment_value collected per order_id.
	SELECT order_id, SUM(payment_value)AS total_payment
	FROM order_payments
	GROUP BY order_id
	ORDER BY total_payment DESC;
--Count total orders by order_status.
	SELECT order_status, COUNT(*)AS total_orders
	FROM orders
	GROUP BY order_status
	ORDER BY total_orders DESC;
--Find the average review_score for each product.
	SELECT review_id, AVG(review_score) AS average_score
    FROM order_reviews
	GROUP BY review_id
	ORDER BY average_score;
--Count how many sellers exist in each seller_state.
	SELECT seller_state, COUNT(seller_id)AS total_sellers
	 FROM sellers
	 GROUP BY seller_state
	 ORDER BY total_sellers DESC;
--Calculate the total number of orders per month (group by month).
	SELECT strftime('%m', order_purchase_timestamp) AS month, COUNT(order_id) AS total_orders
	FROM orders
	GROUP BY month
	ORDER BY month ASC;
--Find the total freight cost per seller (SUM(freight_value)).
	SELECT seller_id, SUM(freight_value) AS total_freight_cost
	FROM order_items 
	GROUP BY seller_id 
	ORDER BY total_freight_cost DESC; 
--Show the average product weight per category.
	SELECT product_category_name, ROUND(AVG(product_weight_g), 2)AS average_weight
	FROM products
	GROUP BY product_category_name
	ORDER BY average_weight DESC;
--Find how many reviews each review_score value received.
	SELECT review_score, COUNT(review_id) AS total_reviews
	FROM order_reviews
	GROUP BY review_score
	ORDER BY total_reviews DESC;


	