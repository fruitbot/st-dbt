with source as (
    select * from {{ source('source_kering_onboarding', 'order_details') }}
),

transformed as (
    select 
        row_number() over() as order_details_id,
        OrderID as order_id,
        ProductID as product_id,
        Quantity as order_details_quantity,
        current_timestamp() as ingested_at
    from source
)

select * from transformed