with source as (
    select * from `kering-onboarding`.`dataset_st_dbt`.`orders`
),

transformed as (
    select 
        OrderID as order_id,
        CustomerID as customer_id,
        EmployeeID as employee_id,
        OrderDate as order_date,
        RequiredDate as order_required_date,
        shippedDate as order_shipped_date,
        ShipVia as shipper_id,
        ShipName as ship_name,
        ShipCity as ship_city,
        ShipCountry as ship_country
    from source
)

select * from transformed