-- stg_orders.sql
-- stg_orders.sql
WITH cleaned_orders AS (
    SELECT
        order_id,
        customer_id,
        store_id,
        order_date,
        order_time,
        total_amount,
        discount,
        tax_amount,
        TRIM(payment_method) AS payment_method,
        TRIM(shipping_address) AS shipping_address,
        TRIM(billing_address) AS billing_address,
        TRIM(order_status) AS order_status,
        TRIM(shipping_method) AS shipping_method,
        delivery_date
    FROM {{ source('raw', 'orders') }}
)

SELECT * FROM cleaned_orders
