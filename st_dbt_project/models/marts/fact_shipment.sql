with orders as (
    select * from {{ ref('stg_orders') }}
),

order_details as (
    select * from {{ ref('stg_order_details') }}
),

products as (
    select * from {{ ref('stg_products') }}
),

shippers as (
    select * from {{ ref('stg_shippers') }}
),

final as (
    select 
        order_details.order_details_id,
        order_details.order_details_quantity,
        orders.order_id,
        orders.order_required_date,
        orders.order_shipped_date,
        orders.ship_name,
        orders.ship_city,
        orders.ship_country,
        products.product_id,
        shippers.shipper_id,
        current_timestamp() as ingested_at
    from order_details
    left join orders on order_details.order_id = orders.order_id
    left join products on order_details.product_id = products.product_id
    left join shippers on orders.shipper_id = shippers.shipper_id
)

select * from final

{{ limit_data_to_eu(column_name='ship_country') }}