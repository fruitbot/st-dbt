with order_details as (
    select * from {{ ref("stg_order_details") }}
),

products as (
    select * from {{ ref("stg_products") }}
)

select
    sum(order_details.order_details_quantity * products.product_unit_price) as total_revenue
from order_details
left join products on order_details.product_id = products.product_id