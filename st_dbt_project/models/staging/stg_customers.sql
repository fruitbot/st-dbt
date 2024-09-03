with source as (
    select * from `kering-onboarding`.`dataset_st_dbt`.`customers`
),

transformed as (
    select 
        CustomerID as customer_id,
        CompanyName as customer_company_name,
        ContactName as customer_contact_name,
        ContactTitle as customer_contact_title,
        City as customer_city,
        Country as customer_country,
        Phone as customer_phone
    from source
)

select * from transformed