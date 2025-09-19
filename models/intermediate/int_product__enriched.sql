with
    -- Importing model from staging
    product as (
        select *
        from {{ref("stg_erp__product")}}
    )
    , subcategory as (
        select *
        from {{ref("stg_erp__productsubcategory")}}
    )
    , category as (
        select *
        from {{ref("stg_erp__productcategory")}}
    )
    -- Joinning tables
    , joined as (
        select 
            product.product_pk
            , product.discontinueddate
            , product.product_name
            , subcategory.subcategory_name
            , category.category_name
        from product
        left join subcategory on product.subcategory_fk = subcategory.subcategory_pk
        left join category on subcategory.category_fk = category.category_pk
    )

select * from joined
