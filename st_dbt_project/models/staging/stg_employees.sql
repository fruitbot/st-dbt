with source as (
    select * from {{ source('source_kering_onboarding', 'employees') }}
),

transformed as (
    select 
        EmployeeID as employee_id,
        LastName as employee_lastname,
        FirstName as employee_firstname,
        concat(FirstName, ' ', LastName) as employee_fullname,
        Title as employee_title,
        City as employee_city,
        Country as employee_country,
        Salary as employee_salary,
        current_timestamp() as ingested_at
    from source
)

select * from transformed