-- stg_promotions.sql
WITH cleaned_promotions AS (
    SELECT
        promotion_id,
        TRIM(promotion_code) AS promotion_code,
        TRIM(description) AS description,
        discount_percentage,
        start_date,
        end_date,
        product_id
    FROM {{ ref('promotions') }}
)

SELECT * FROM cleaned_promotions
