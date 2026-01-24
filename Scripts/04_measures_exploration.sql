 /*
===============================================================================
Measures Exploration (Key Metrics)
===============================================================================
Purpose:
    - To calculate aggregated metrics (e.g., totals, averages) for quick insights.
    - To identify overall trends or spot anomalies.

MYSQL Functions Used:
    - COUNT(), SUM(), AVG()
===============================================================================
*/

 -- Find total sales
 
 SELECT 
   SUM(sales_amount) as total_sales
 FROM fact_sales;
 
 -- Find how many items are sold
 
 SELECT 
   SUM(quantity) as total_quantity 
 FROM fact_sales;
 
 -- Find the average selling price
 
 SELECT 
   AVG(price) as avg_price 
 FROM fact_sales;
 
 -- Find the total number of orders
 
 SELECT 
   COUNT(DISTINCT order_number) as total_orders 
 FROM fact_sales;
 
 -- Find the total number of products
 
SELECT 
  COUNT(product_name) as total_products 
 FROM dim_products;
 
 -- Find the total number of customers
 
 SELECT 
   COUNT(DISTINCT customer_key) as total_customers 
 FROM dim_customers;
 
 -- Find the total number of customers that has placed an order
 
 SELECT 
   COUNT(DISTINCT customer_key) as total_customers 
 FROM fact_sales;
 
 -- Generate a report that shows all key matrics of the business.
 
 SELECT 
	  'Total Sales' as measure_name, 
	   SUM(sales_amount) as measure_value
 FROM fact_sales
 UNION ALL
 SELECT 
	 'Total Quantity' as measure_name, 
	  SUM(quantity) as measure_value
 FROM fact_sales
 UNION ALL
 SELECT 
	 'Average Price' as measure_name, 
	  AVG(price) as measure_value
 FROM fact_sales
 UNION ALL
 SELECT
	 'Total Orders' as measure_name, 
	  COUNT(DISTINCT order_number) as measure_value 
 FROM fact_sales
 UNION ALL
 SELECT
	 'Total Products' as measure_name, 
	  COUNT(DISTINCT product_name) as measure_value 
 FROM dim_products
 UNION ALL
 SELECT
	 'Total Customers' as measure_name, 
	  COUNT(DISTINCT customer_key) as measure_value 
 FROM dim_customers
 UNION ALL
 SELECT
	 'Total Customers Orders' as measure_name, 
	  COUNT(DISTINCT customer_key) as measure_value 
 FROM fact_sales
