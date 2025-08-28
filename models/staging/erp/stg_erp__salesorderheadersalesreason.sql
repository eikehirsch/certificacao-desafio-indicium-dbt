with 
    orderheadersalesreason as (
        select * 
        from {{ source('erp', 'sales_salesorderheadersalesreason') }}
    )
    , renamed as (
        select
            {{ dbt_utils.generate_surrogate_key(['salesorderid', 'salesreasonid']) }} as order_header_sales_reason_sk
            , cast(orderheadersalesreason.salesorderid as int) as salesorder_fk
            , cast(salesreasonid as int) as salesreason_fk
        from orderheadersalesreason
    )

select * from renamed
