{%macro audit_columns()%}

    current_timestamp::timestamp_ntz as inserted_at,
    'dbt' as inserted_by

{%endmacro%}