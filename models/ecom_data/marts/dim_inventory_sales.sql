SELECT 
    SKU_Code, 
    ROUND(SUM(Amount),2) as Item_sales, 
    ROUND(AVG(Amount),2) as Avg_price,
    inventory.Category, 
    COUNT(Order_ID) as Num_sold, 
    inventory.Size, 
    Color
FROM {{ ref ('stg_inventory')}} as inventory
JOIN {{ ref ('stg_amazon_sales')}} as sales 
ON inventory.SKU_CODE = sales.SKU
WHERE Amount != 0 AND Status != 'Cancelled'
GROUP BY 
    SKU_CODE, 
    inventory.Category, 
    inventory.Size, 
    Color
ORDER BY num_sold DESC