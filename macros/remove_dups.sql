{% macro remove_dups_ts(tgt_table, src_table, unique_key, ts_col) %}

CREATE TABLE IF NOT EXISTS CURATED_DATA.{{tgt_table}} AS select * from RAW_DATA.{{src_table}} where 1=2;

{% if ts_col == 'NA' %}

insert into CURATED_DATA.{{tgt_table}}
select *
from raw_data.{{src_table}}
qualify row_number() over(partition by {{unique_key}} order by {{unique_key}}) = 1;

{% else %}

insert into CURATED_DATA.{{tgt_table}}
select *
from raw_data.{{src_table}}
qualify row_number() over(partition by {{unique_key}} order by {{ts_col}}) = 1;

{% endif %}

{% endmacro %}