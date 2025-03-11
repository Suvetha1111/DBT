-- customer_behavior_loyalty_report.sql
WITH customer_data AS (
    SELECT
        c.customer_id,
        CONCAT(TRIM(c.firstname), ' ', TRIM(c.lastname)) AS customer_name,
        CASE
            WHEN EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM c.registration_date) < 18 THEN 'Below 18'
            WHEN EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM c.registration_date) BETWEEN 18 AND 30 THEN '18-30'
            WHEN EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM c.registration_date) BETWEEN 31 AND 45 THEN '31-45'
            WHEN EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM c.registration_date) BETWEEN 46 AND 60 THEN '46-60'
            ELSE 'Above 60'
        END AS age_group,
        c.loyalty_program_status AS membership_level,
        COUNT(DISTINCT o.order_id) AS total_orders,
        ROUND(AVG(o.total_amount), 2) AS average_order_value,
        COALESCE(COUNT(DISTINCT r.return_id), 0) AS number_of_returns,
        MAX(o.order_date) AS last_order_date,
        DATEDIFF('YEAR', c.registration_date, CURRENT_DATE) AS customer_tenure,
        COALESCE(SUM(r.quantity), 0) AS total_return,
        COALESCE(SUM(r.refund_amount), 0) AS total_return_amount,
        COALESCE(SUM(o.discount), 0) AS total_discount_used
    FROM {{ ref('stg_customers') }} AS c
    LEFT JOIN {{ ref('stg_orders') }} AS o
        ON c.customer_id = o.customer_id
    LEFT JOIN {{ ref('stg_returns') }} AS r
        ON o.order_id = r.order_id
    GROUP BY
        c.customer_id,
        c.firstname,
        c.lastname,
        c.registration_date,
        c.loyalty_program_status
)

SELECT * FROM customer_data
