{% macro calculate_return_counts(return_column) %}
    COUNT(DISTINCT {{ return_column }})
{% endmacro %}
