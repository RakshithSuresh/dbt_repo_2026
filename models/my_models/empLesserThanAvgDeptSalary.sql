{{config
(
    materialized = 'table',
    alias = 'employee_lt_avg'
)}}

select e.* from raw_data.employee e
join {{ref("emp_ephemeral")}} eavg
on e.departmentname = eavg.departmentname and e.departmentnumber = eavg.departmentnumber
and e.salary < eavg.avgSalary