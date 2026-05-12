{{config
(
    materialized = 'incremental',
    alias = 'fact_orders_tbl'
)
}}

SELECT * from RAW_DATA.ORDERS -- this only creates table for first run

-- this syntax between '%' is called as macros
{%if is_incremental() %} -- this is used to check if target table is already existing or not, if true it executes below step
-- incremental happens here below
where order_date > (select max(order_date) from {{this}} ) -- here the keyword "this" is referred to target table which we are working in this model

{%endif%}