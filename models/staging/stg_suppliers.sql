-- stg_suppliers.sql
WITH cleaned_suppliers AS (
    SELECT
        supplier_id,
        TRIM(supplier_name) AS supplier_name,
        TRIM(contact_name) AS contact_name,
        TRIM(contact_email) AS contact_email,
        TRIM(contact_phone) AS contact_phone,
        TRIM(address) AS address,
        TRIM(city) AS city,
        TRIM(state) AS state,
        TRIM(postal_code) AS postal_code,
        TRIM(country) AS country
    FROM {{ ref('suppliers') }}
)

SELECT * FROM cleaned_suppliers
