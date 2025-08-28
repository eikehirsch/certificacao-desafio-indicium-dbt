with 
    salesreason as (
        select * 
        from {{ source('erp', 'sales_salesreason') }}
    )
    , renamed as (
        select
            cast(salesreasonid as int) as salesreason_pk
            , cast(name as varchar) as reason_name
            , cast(reasontype as varchar) as reasontype
        from salesreason
    )

select * from renamed
