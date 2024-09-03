with source as (
    select * from `kering-onboarding`.`dataset_st_dbt`.`shippers`
),

transformed as (
    select 
        ShipperID as shipper_id,
        CompanyName as shipper_company_name,
        Phone as shipper_phone
    from source
)

select * from transformed