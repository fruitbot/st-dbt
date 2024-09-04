with source as (
    select * from {{ source('source_kering_onboarding', 'orders') }}
),

transformed as (
    select 
        OrderID as order_id,
        CustomerID as customer_id,
        EmployeeID as employee_id,
        OrderDate as order_date,
        RequiredDate as order_required_date,
        cast(shippedDate as timestamp) as order_shipped_date,
        ShipVia as shipper_id,
        ShipName as ship_name,
        ShipCity as ship_city,
        ShipCountry as ship_country,
        current_timestamp() as ingested_at
    from source
)

select * from transformed