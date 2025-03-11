-- stg_customers.sql
WITH cleaned_customers AS (
    SELECT
        customer_id,
        TRIM(first_name) AS firstname,
        TRIM(last_name) AS lastname,
        CONCAT(TRIM(first_name), ' ', TRIM(last_name)) AS customer_name,
        TRIM(email) AS email,
        TRIM(phone_number) AS phonenumber,
        registration_date,
        loyalty_program_status,
        {{ calculate_age_group('registration_date') }} AS age_group
    FROM {{ source('raw', 'customers') }}
)

SELECT * FROM cleaned_customers



