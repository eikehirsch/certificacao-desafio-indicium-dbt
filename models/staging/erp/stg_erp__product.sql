with 
    product as (
        select * 
        from {{ source('erp', 'production_product') }}
    )
    , renamed as (
        select
            cast(productid as int) as product_pk
            , cast(productsubcategoryid as int) as subcategory_fk
            , cast(discontinueddate as date) as discontinueddate
            , cast(weight as numeric(18, 2)) as weight
            , cast(standardcost as numeric(18, 4)) as standardcost
            , cast(listprice as numeric(18, 3)) as listprice
            , cast(name as varchar) as product_name

        from product
    )

select * from renamed
