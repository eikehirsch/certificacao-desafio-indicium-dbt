with
    --Importing model from staging
    stg_erp__salesorderheadersalesreason as (
        select *
        from {{ref("stg_erp__salesorderheadersalesreason")}}
    )
    , cleaned as (
        select
            stg_erp__salesorderheadersalesreason.sales_order_header_reason_sk
            , stg_erp__salesorderheadersalesreason.salesorder_fk
            , stg_erp__salesorderheadersalesreason.salesreason_fk
        from stg_erp__salesorderheadersalesreason
    )

    select * from cleaned
    