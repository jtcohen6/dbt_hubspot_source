{% macro get_contact_property_history_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "contact_id", "datatype": dbt_utils.type_int()},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "source", "datatype": dbt_utils.type_string()},
    {"name": "source_id", "datatype": dbt_utils.type_string()},
    {"name": "timestamp", "datatype": dbt_utils.type_timestamp()},
    {"name": "value", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
