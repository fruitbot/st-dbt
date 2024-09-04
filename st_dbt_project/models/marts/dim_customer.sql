with customers as (
    select * from {{ ref('stg_customers') }}
),

final as (
    select 
        customer_id,
        customer_company_name,
        customer_contact_name,
        customer_contact_title,
        customer_city,
        customer_country,
        customer_phone,
        current_timestamp() as ingested_at
    from customers
)

select * from final
order by customer_id