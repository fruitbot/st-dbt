with source as (
    select * from {{ source('source_kering_onboarding', 'customers') }}
),

transformed as (
    select 
        CustomerID as customer_id,
        CompanyName as customer_company_name,
        ContactName as customer_contact_name,
        ContactTitle as customer_contact_title,
        City as customer_city,
        Country as customer_country,
        Phone as customer_phone,
        current_timestamp() as ingested_at
    from source
)

select * from transformed