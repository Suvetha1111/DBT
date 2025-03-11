-- stg_stores.sql
WITH cleaned_stores AS (
    SELECT
        store_id,
        TRIM(store_name) AS store_name,
        TRIM(location) AS location,
        TRIM(address) AS address,
        TRIM(city) AS city,
        TRIM(state) AS state,
        TRIM(postal_code) AS postal_code,
        TRIM(country) AS country,
        TRIM(manager_name) AS manager_name,
        opening_date,
        TRIM(store_type) AS store_type
    FROM {{ ref('stores') }}
)

SELECT * FROM cleaned_stores
