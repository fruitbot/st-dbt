with source as (
    select * from `kering-onboarding`.`dataset_st_dbt`.`categories`
),

transformed as (
    select 
        CategoryID as category_id,
        CategoryName as category_name,
        Description as description
    from source
)

select * from transformed