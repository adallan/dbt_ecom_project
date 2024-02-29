SELECT 
customer_id,
Status,
Category,
COUNT(Order_ID) as num_cancelled,
COALESCE(ROUND(SUM(Amount),2),0) as total_cancelled_amount
FROM {{ref ('stg_customers')}} as customers
JOIN {{ref ('stg_amazon_sales')}} as sales 
ON customers.postal_code = sales.ship_postal_code
WHERE status = 'Cancelled'
GROUP BY customer_id ,Status, Category
ORDER BY customer_id