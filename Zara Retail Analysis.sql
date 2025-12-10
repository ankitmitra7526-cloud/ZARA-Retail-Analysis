CREATE DATABASE ZARA;
USE ZARA;
SELECT * FROM sales_data LIMIT 10;

#1.Find the top 5 best-selling products by sales volume.
SELECT 
  product_id,
  name, 
  sales_volume
FROM sales_data
ORDER BY sales_volume DESC
LIMIT 5;

#2.Which product positions (Aisle, End-cap, Front of Store) generate the highest average sales volume?
SELECT product_position, Avg(sales_volume) as average_sales_volume
FROM sales_data
GROUP BY product_position
ORDER BY average_sales_volume DESC;

#3.Find total revenue for each product.
SELECT 
  product_id,
  name,
  ROUND((sales_volume*price),2) AS revenue
FROM sales_data
ORDER BY revenue DESC;

#4.Rank top 10 products by revenue using a window function.
SELECT 
  product_id,
  name,
  ROUND((sales_volume*price),2) AS revenue,
  RANK() OVER (ORDER BY sales_volume*price DESC) AS revenue_rank
FROM sales_data
LIMIT 10;

#5.Compare average price elasticity across sections.
SELECT section, ROUND(Avg(price_elasticity),2) AS Avg_price_elasticity
FROM sales_data
GROUP BY section
ORDER BY Avg_price_elasticity DESC;

#6.Find all products that are both promoted and seasonal and have sales above the median.
SELECT
  product_id,
  name,
  sales_volume
FROM sales_data
WHERE promotion = "Yes"
AND seasonal = "Yes"
AND sales_volume > (
WITH ordered AS (
    SELECT 
        sales_volume,
        ROW_NUMBER() OVER (ORDER BY sales_volume) AS rn,
        COUNT(*) OVER () AS cnt
    FROM sales_data
)
SELECT 
    AVG(sales_volume) AS median_sales
FROM ordered
WHERE rn IN (FLOOR((cnt + 1)/2), CEIL((cnt + 1)/2))
);
        
#7.Identify which season generates the highest total revenue.
SELECT season, ROUND(SUM(sales_volume*price),2) AS total_revenue
FROM sales_data
GROUP BY season
ORDER BY total_revenue DESC;

#8.Perform 80/20 Pareto analysis: which products contribute to 80% of total revenue?
WITH revenue_calc AS (
    SELECT
        product_id,
        name,
        ROUND((price * sales_volume),2) AS revenue
    FROM sales_data
),
ordered AS (
    SELECT
        *,
        SUM(revenue) OVER (ORDER BY revenue DESC) /
        SUM(revenue) OVER () AS cum_revenue_pct
    FROM revenue_calc
)
SELECT 
    product_id,
    name,
    revenue,
    cum_revenue_pct
FROM ordered
WHERE cum_revenue_pct <= 0.80;

#9.Find the most common material used among fast-selling products (sales_volume > 1000).
SELECT 
  material,
  Count(material) AS material_count,
  RANK() OVER (ORDER BY Count(material) DESC) AS use_rank
FROM sales_data
WHERE sales_volume > 1000
GROUP BY material;

#10.Identify high-elasticity products that are also low-priced.
SELECT
  product_id,
  name,
  price_category,
  ROUND(price_elasticity,2) as price_elasticity
FROM sales_data
WHERE price_category = "Low"
AND price_elasticity >= ( SELECT AVG(price_elasticity) FROM sales_data)
ORDER BY price_elasticity DESC;
