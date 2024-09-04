with final as (
    select 

        fact_shipment.order_details_id,
        fact_shipment.order_details_quantity,
        fact_shipment.order_id,
        fact_shipment.order_required_date,
        fact_shipment.order_shipped_date,
        fact_shipment.ship_name,
        fact_shipment.ship_city,
        fact_shipment.ship_country,
        dim_product.product_id,
        dim_product.product_name,
        dim_product.supplier_company_name,
        dim_product.category_name,
        dim_product.product_unit_price,
        dim_product.product_unit_in_stock,
        dim_product.product_is_discontinued,
        dim_shipper.shipper_id,
        dim_shipper.shipper_company_name,
        dim_shipper.shipper_phone,
        current_timestamp() as ingested_at
    from {{ ref('fact_shipment') }} fact_shipment
    left join {{ ref('dim_product') }} dim_product on fact_shipment.product_id = dim_product.product_id
    left join {{ ref('dim_shipper') }} dim_shipper on fact_shipment.shipper_id = dim_shipper.shipper_id
)

select * from final