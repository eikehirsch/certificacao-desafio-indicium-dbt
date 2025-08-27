with
    int_address as (
        select *
        from {{ref("int_customer__enriched")}}
    )

select * from int_address
