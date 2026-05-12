{%macro audit_macro (model_name, status)%}

    insert into audit_tbl
    values( '{{model_name}}' , '{{status}}', current_timestamp::timestamp_ntz);

{%endmacro%}