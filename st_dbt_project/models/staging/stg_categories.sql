with source as (
    select * from {{ source('source_kering_onboarding', 'categories') }}
 ),
 
transformed as (
    select 
        CategoryID as category_id,
        CategoryName as category_name,
        Description as description,
        current_timestamp() as ingested_at
    from source
)

select * from transformed