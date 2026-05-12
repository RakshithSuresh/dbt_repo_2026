{{config
    (
        materialized = 'table',
        alias = 'sales_agg',
        pre_hook = "{{remove_dups_ts('orders_cleaned', 'orders_date', 'order_id', 'updated_or_inserted_at')}}"
    )
}}


select
product_id,
count(order_id) as orders_placed,
sum(quantity) as units_sold
from CURATED_DATA.orders_cleaned
group by 1