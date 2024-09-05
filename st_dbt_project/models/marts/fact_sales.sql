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

order_detail_quantity_times_price as (
  select
      orders.order_id,
      order_details.order_details_quantity * products.product_unit_price as order_detail_amount
  from orders
  left join order_details on orders.order_id = order_details.order_id
  left join products on order_details.product_id = products.product_id
),

order_sum_up_total_amount as (
  select
    order_id,
    sum(order_detail_amount) as order_total_amount
  from order_detail_quantity_times_price
  group by order_id
),

final as (
    select 
        order_details.order_details_id,
        orders.order_id,
        products.product_id,
        customers.customer_id,
        employees.employee_id,
        order_details.order_details_quantity,
        order_sum_up_total_amount.order_total_amount,
        orders.order_date,
        current_timestamp() as ingested_at
    from order_details
    left join orders on order_details.order_id = orders.order_id
    left join products on order_details.product_id = products.product_id
    left join customers on orders.customer_id = customers.customer_id
    left join employees on orders.employee_id = employees.employee_id
    left join order_sum_up_total_amount on order_details.order_id = order_sum_up_total_amount.order_id
)

select * from final