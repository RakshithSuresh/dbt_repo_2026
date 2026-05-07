-- writing config inside the model and giving it a different name using jinja language
{{config
    (
        materialized = 'table',
        alias = 'revenue' ,

        pre_hook = "{{audit_macro(
        '{{this}}',
        'started' 
        )
        }}",

        post_hook = "{{audit_macro(
        '{{this}}',
        'completed' 
        )
        }}",
    )   
}}

SELECT
    p.NAME AS PRODUCT_NAME,
    {{audit_columns()}},
    SUM(o.QUANTITY * p.UNIT_PRICE) AS REVENUE
FROM DBT.RAW_DATA.ORDERS o
JOIN DBT.RAW_DATA.PRODUCTS p
    ON o.PRODUCT_ID = p.PRODUCT_ID
GROUP BY 1,2
ORDER BY REVENUE DESC