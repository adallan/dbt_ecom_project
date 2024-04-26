SELECT
    customer_id,
    COUNT(*) AS num_purchases,
    SUM(Amount) AS total_spent,
    ROUND(AVG(Amount),2) AS avg_order
FROM {{ref ('stg_customers')}} AS customers
JOIN {{ref ('stg_amazon_sales')}} AS sales
ON customers.postal_code = sales.ship_postal_code
WHERE 
    Amount != 0 AND Status != 'Cancelled'
GROUP BY customer_id
HAVING total_spent > 10000
ORDER BY total_spent DESC