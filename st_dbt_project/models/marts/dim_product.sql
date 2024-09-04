with products as (
    select * from {{ ref('stg_products') }}
),

suppliers as (
    select * from {{ ref('stg_suppliers') }}
),

categories as (
    select * from {{ ref('stg_categories') }}
),

final as (
    select 
        products.product_id,
        products.product_name,
        suppliers.supplier_company_name,
        categories.category_name,
        products.product_unit_price,
        products.product_unit_in_stock,
        products.product_is_discontinued,
        current_timestamp() as ingested_at
    from products
    left join suppliers on products.supplier_id = suppliers.supplier_id
    left join categories on products.category_id = categories.category_id

)

select * from final
order by product_id