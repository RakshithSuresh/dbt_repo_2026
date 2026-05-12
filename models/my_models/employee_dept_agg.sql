{{config(materialized = 'table', alias = 'emp_all_agg',
    pre_hook = "{{remove_dups_ts('employee_unique', 'employee','empid', 'NA')}}"
)}}


select
    departmentnumber,
    sum(salary) as totalSalary,
    avg(salary) as avgSalary,
    min(salary) as minSalary,
    max(salary) as maxSalary
from CURATED_DATA.employee_unique
group by 1
order by 1
