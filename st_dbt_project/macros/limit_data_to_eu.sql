{% macro limit_data_to_eu(column_name) %}
where {{ column_name }} in ('France', 'Germany', 'Finland', 'Austria', 'Belgium', 'Norway', 'Denmark', 'Sweden', 'Spain', 'Italy')
{% endmacro %}