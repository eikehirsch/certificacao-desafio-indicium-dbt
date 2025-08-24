with 
    source_sales_salesorderheadersalesreason as (
    select * 
    from {{ source('erp', 'sales_salesorderheadersalesreason') }}
),

renamed as (
    select
        {{ dbt_utils.generate_surrogate_key(['salesorderid', 'salesreasonid']) }} as sales_order_header_reason_sk
        , cast(salesreasonid as int) as salesreason_fk
    from source_sales_salesorderheadersalesreason
)

select * from renamed
