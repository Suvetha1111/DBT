-- stg_returns.sql
WITH cleaned_returns AS (
    SELECT
        return_id,
        order_id,
        product_id,
        return_date,
        TRIM(return_reason) AS return_reason,
        quantity,
        refund_amount
    FROM {{ source('raw', 'returns') }}
)

SELECT * FROM cleaned_returns

