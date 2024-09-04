with employees as (
    select * from {{ ref('stg_employees') }}
),

final as (
    select 
        employee_id,
        employee_lastname,
        employee_firstname,
        employee_title,
        employee_city,
        employee_country,
        employee_salary,
        current_timestamp() as ingested_at
    from employees
)

select * from final
order by employee_id