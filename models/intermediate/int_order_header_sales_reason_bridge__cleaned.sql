with
    --Importing model from staging
    orderheadersalesreason as (
        select *
        from {{ref("stg_erp__salesorderheadersalesreason")}}
    )

    , cleaned as (
        select
            orderheadersalesreason.order_header_sales_reason_sk
            , orderheadersalesreason.salesorder_fk
            , orderheadersalesreason.salesreason_fk
        from orderheadersalesreason
    )

select * from cleaned
    