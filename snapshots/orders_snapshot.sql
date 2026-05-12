{% snapshot customer_orders_snapshot %}

{{
    config(
        target_database = 'dbt',
        target_schema = 'curated_data',
        unique_key = 'order_id',
        strategy = 'timestamp',
        updated_at = 'updated_at'
    )
}}

SELECT * FROM DBT.RAW_DATA.CUSTOMER_ORDERS

{%endsnapshot%}