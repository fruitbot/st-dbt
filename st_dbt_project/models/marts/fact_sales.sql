with orders as (
    select * from {{ ref('stg_orders') }}
),

order_details as (
    select * from {{ ref('stg_order_details') }}
),

products as (
    select * from {{ ref('stg_products') }}
),

customers as (
    select * from {{ ref('stg_customers') }}
),

employees as (
    select * from {{ ref('stg_employees') }}
),

final as (
    select 
        order_details.order_details_id,
        order_details.order_details_quantity,
        orders.order_id,
        orders.order_date,
        customers.customer_id,
        employees.employee_id,
        products.product_id,
        current_timestamp() as ingested_at
    from order_details
    left join orders on order_details.order_id = orders.order_id
    left join products on order_details.product_id = products.product_id
    left join customers on orders.customer_id = customers.customer_id
    left join employees on orders.employee_id = employees.employee_id
)

select * from final