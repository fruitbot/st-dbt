with source as (
    select * from {{ source('source_kering_onboarding', 'shippers') }}
),

transformed as (
    select 
        ShipperID as shipper_id,
        CompanyName as shipper_company_name,
        Phone as shipper_phone,
        current_timestamp() as ingested_at
    from source
)

select * from transformed