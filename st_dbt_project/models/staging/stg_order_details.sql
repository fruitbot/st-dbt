{{
    config(
        materialized = 'incremental',
        unique_key = 'order_details_id'
    )
}}

with source as (
    select * from {{ source('source_kering_onboarding', 'order_details') }}
),

transformed as (
    select 
        {{ dbt_utils.generate_surrogate_key(['OrderID', 'ProductID']) }} as order_details_id,
        OrderID as order_id,
        ProductID as product_id,
        Quantity as order_details_quantity,
        cast('2024-09-09 08:06:05.275569 UTC' as timestamp) as ingested_at,
        cast('2024-09-09 10:00:00.275569 UTC' as timestamp) as max_ingested_at
    from source
)

select * from transformed
{% if is_incremental() %}
where ingested_at >= (select max(max_ingested_at) from {{ this }})
{% endif %}
