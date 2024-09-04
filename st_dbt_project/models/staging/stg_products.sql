with source as (
    select * from {{ source('source_kering_onboarding', 'products') }}
),

transformed as (
    select 
        ProductID as product_id,
        ProductName as product_name,
        SupplierID as supplier_id,
        CategoryID as category_id,
        UnitPrice as product_unit_price,
        UnitsInStock as product_unit_in_stock,
        Discontinued as product_is_discontinued,
        current_timestamp() as ingested_at
    from source
)

select * from transformed