with source as (
    select * from `kering-onboarding`.`dataset_st_dbt`.`employees`
),

transformed as (
    select 
        EmployeeID as employee_id,
        LastName as employee_lastname,
        FirstName as employee_firstName,
        Title as employee_title,
        City as employee_city,
        Country as employee_country,
        Salary as employee_salary
    from source
)

select * from transformed