with 
    source as (
    select * 
    from {{ source('erp', 'production_productsubcategory') }}
),

renamed as (
    select
        cast(productsubcategoryid as int) as subcategory_pk
        , cast(productcategoryid as int) as category_fk
        , cast(name as varchar) as subcategory_name
    from source
)

select * from renamed
