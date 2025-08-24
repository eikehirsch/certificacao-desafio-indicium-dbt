with 
    source_sales_salesreason as (
    select * 
    from {{ source('erp', 'sales_salesreason') }}
),

renamed as (
    select
        cast(salesreasonid as int) as salesreason_pk
        , cast(name as varchar) as name
        , cast(reasontype as varchar) as reasontype
    from source_sales_salesreason
)

select * from renamed
