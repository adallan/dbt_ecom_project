SELECT Order_ID as order_id, Date, Status, Style, SKU, Category, Size, Amount, B2B, Qty as quantity, promotion_ids, ship_postal_code
FROM {{ source ('ecom_data', 'Amazon_sales_report')}}