with 
    category as (
        select * 
        from {{ source('erp', 'production_productcategory') }}
    )
    , renamed as (
        select
            cast(productcategoryid as int) as category_pk
            , cast(name as varchar) as category_name
        from category
    )

select * from renamed
