with shippers as (
    select * from {{ ref('stg_shippers') }}
),

final as (
    select 
        shipper_id,
        shipper_company_name,
        shipper_phone,
        current_timestamp() as ingested_at
    from shippers
)

select * from final
order by shipper_id