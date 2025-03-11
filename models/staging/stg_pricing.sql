-- stg_pricing.sql
WITH cleaned_pricing AS (
    SELECT
        price_id,
        product_id,
        effective_date,
        price,
        discounted_price,
        TRIM(promotion_code) AS promotion_code
    FROM {{ ref('pricing') }}
)

SELECT * FROM cleaned_pricing
