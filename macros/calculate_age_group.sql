{% macro calculate_age_group(date_column) %}
    CASE 
        WHEN DATEDIFF(YEAR, {{ date_column }}, CURRENT_DATE) < 18 THEN 'Under 18'
        WHEN DATEDIFF(YEAR, {{ date_column }}, CURRENT_DATE) BETWEEN 18 AND 24 THEN '18-24'
        WHEN DATEDIFF(YEAR, {{ date_column }}, CURRENT_DATE) BETWEEN 25 AND 34 THEN '25-34'
        WHEN DATEDIFF(YEAR, {{ date_column }}, CURRENT_DATE) BETWEEN 35 AND 44 THEN '35-44'
        WHEN DATEDIFF(YEAR, {{ date_column }}, CURRENT_DATE) BETWEEN 45 AND 54 THEN '45-54'
        WHEN DATEDIFF(YEAR, {{ date_column }}, CURRENT_DATE) >= 55 THEN '55+'
        ELSE 'Unknown'
    END
{% endmacro %}
