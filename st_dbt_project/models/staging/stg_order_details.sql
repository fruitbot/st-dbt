with source as (
    select * from `kering-onboarding`.`dataset_st_dbt`.`order_details`
),

transformed as (
    select 
        OrderID as order_id,
        ProductID as product_id,
        Quantity as order_details_quantity
    from source
)

select * from transformed