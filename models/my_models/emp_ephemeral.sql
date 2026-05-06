{{
    config
    (
        materialized = 'ephemeral'
    )
}}

select
departmentnumber, departmentname, avg(salary) as avgSalary
from raw_data.employee
group by 1,2