with 
    source_production_product as (
    select * 
    from {{ source('erp', 'production_product') }}
),

renamed as (
    select
        cast(productid as int) as product_pk
        , cast(productsubcategoryid as int) as productsubcategory_fk
        , cast(productmodelid as int) as productmodel_fk
        , cast(discontinueddate as date) as discontinueddate
        , cast(weight as numeric(18, 2)) as weight
        , cast(standardcost as numeric(18, 4)) as standardcost
        , cast(listprice as numeric(18, 3)) as listprice
        , cast(name as varchar) as product_name
        , cast(productnumber as varchar) as product_number
        , cast(productline as varchar) as productline
    from source_production_product
)

select * from renamed
