WITH store_metrics AS (
    SELECT
        s.store_id,
        s.store_name,
        s.location,
        COUNT(DISTINCT e.employee_id) AS total_employees,
        SUM(oli.quantity) AS total_units_sold,
        COUNT(DISTINCT o.customer_id) AS total_customers,
        COUNT(DISTINCT o.order_id) AS total_orders,
        {{ calculate_return_counts('r.return_id') }} AS returned_order_counts,
        SUM(o.total_amount) AS total_sales_amount,
        ROUND(AVG(o.total_amount), 2) AS average_order_value,
        s.store_type
    FROM {{ ref('stg_stores') }} s
    LEFT JOIN {{ ref('stg_employees') }} e ON s.store_id = e.store_id
    LEFT JOIN {{ ref('stg_orders') }} o ON s.store_id = o.store_id
    LEFT JOIN {{ ref('stg_order_line_items') }} oli ON o.order_id = oli.order_id
    LEFT JOIN {{ ref('stg_returns') }} r ON oli.order_id = r.order_id
    GROUP BY
        s.store_id,
        s.store_name,
        s.location,
        s.store_type
)

SELECT * FROM store_metrics
