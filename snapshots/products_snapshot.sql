{%snapshot products_snapshot%}

{{
     config(
        target_database = 'dbt',
        target_schema = 'curated_data',
        unique_key ='product_id',
        strategy = 'check',
        check_cols = ['name','unit_price'],
        invalidate_hard_deletes = TRUE
     )
     }}

select * from RAW_DATA.PRODUCTS
{%endsnapshot%}