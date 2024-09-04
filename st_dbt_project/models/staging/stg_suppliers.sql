with source as (
    select * from {{ source('source_kering_onboarding', 'suppliers') }}
),

transformed as (
    select 
        SupplierID as supplier_id,
        CompanyName as supplier_company_name,
        ContactName as supplier_contact_name,
        ContactTitle as supplier_contact_title,
        City as supplier_city,
        Country as supplier_country,
        Phone as supplier_phone,
        current_timestamp() as ingested_at
    from source
)

select * from transformed