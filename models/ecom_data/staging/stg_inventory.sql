SELECT 
    SKU_Code,
    Design_No_ AS design_num,
    Stock,
    Category,
    Size,
    Color
FROM {{ source ('ecom_data', 'Inventory_report')}}
WHERE SKU_Code IS NOT NULL