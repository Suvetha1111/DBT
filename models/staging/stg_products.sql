-- stg_products.sql
WITH cleaned_products AS (
    SELECT
        product_id,
        TRIM(product_name) AS product_name,
        TRIM(category) AS category,
        TRIM(sub_category) AS sub_category,
        TRIM(brand) AS brand,
        price,
        cost,
        stock_quantity,
        reorder_level,
        supplier_id
    FROM {{ source('raw', 'products') }}
)

SELECT * FROM cleaned_products
