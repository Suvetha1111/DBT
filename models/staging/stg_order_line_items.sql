-- stg_order_line_items.sql
WITH cleaned_order_line_items AS (
    SELECT
        line_item_id,
        order_id,
        product_id,
        quantity,
        unit_price,
        discount,
        subtotal,
        tax_amount,
        total_price
    FROM {{ source('raw', 'order_line_items') }}
)

SELECT * FROM cleaned_order_line_items
