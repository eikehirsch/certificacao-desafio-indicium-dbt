with
    int_product as (
        select *
        from {{ref("int_product__enriched")}}
    )

select * from int_product
