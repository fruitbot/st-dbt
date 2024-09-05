with final as (
    select 
        fact_sales.order_details_id,
        fact_sales.order_id,
        fact_sales.order_total_amount,
        fact_sales.order_details_quantity,
        fact_sales.order_date,
        dim_customer.customer_id,
        dim_customer.customer_company_name,
        dim_customer.customer_contact_name,
        dim_customer.customer_contact_title,
        dim_customer.customer_city,
        dim_customer.customer_country,
        dim_customer.customer_phone,
        dim_employee.employee_id,
        dim_employee.employee_lastname,
        dim_employee.employee_firstname,
        dim_employee.employee_title,
        dim_employee.employee_city,
        dim_employee.employee_country,
        dim_product.product_id,
        dim_product.product_name,
        dim_product.supplier_company_name,
        dim_product.category_name,
        dim_product.product_unit_price,
        dim_product.product_unit_in_stock,
        dim_product.product_is_discontinued,
        current_timestamp() as ingested_at
    from {{ ref('fact_sales') }} fact_sales
    left join {{ ref('dim_customer') }} dim_customer on fact_sales.customer_id = dim_customer.customer_id
    left join {{ ref('dim_employee') }} dim_employee on fact_sales.employee_id = dim_employee.employee_id
    left join {{ ref('dim_product') }} dim_product on fact_sales.product_id = dim_product.product_id
)

select * from final