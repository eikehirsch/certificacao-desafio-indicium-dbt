with 
    source_salesorderheadersalesreason as (
    select * 
    from {{ source('erp', 'sales_salesorderheadersalesreason') }}
)
, renamed as (
    select
        {{ dbt_utils.generate_surrogate_key(['salesorderid', 'salesreasonid']) }} as sales_order_header_reason_sk
        , cast(source_salesorderheadersalesreason.salesorderid as int) as salesorder_fk
        , cast(salesreasonid as int) as salesreason_fk
    from source_salesorderheadersalesreason
)

select * from renamed
