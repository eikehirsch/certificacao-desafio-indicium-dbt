with
    int_salesreason as (
        select *
        from {{ref("stg_erp__salesreason")}}
    )

select * from int_salesreason
