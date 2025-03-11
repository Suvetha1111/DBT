-- stg_employees.sql
WITH cleaned_employees AS (
    SELECT
        employee_id,
        TRIM(first_name) AS first_name,
        TRIM(last_name) AS last_name,
        TRIM(position) AS position,
        hire_date,
        salary,
        store_id,
        TRIM(email) AS email,
        TRIM(phone_number) AS phone_number,
        TRIM(employment_status) AS employment_status
    FROM {{ source('raw', 'employees') }}
)

SELECT * FROM cleaned_employees
