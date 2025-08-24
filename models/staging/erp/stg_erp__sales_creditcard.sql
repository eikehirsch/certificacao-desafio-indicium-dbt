with 
    source_sales_creditcard as (
    select * 
    from {{ source('erp', 'sales_creditcard') }}
),

renamed as (
    select
        cast(creditcardid as int) as creditcard_pk
        , cast(cardtype as varchar) as cardtype
        , cast(cardnumber as varchar) as cardnumber
        , cast(expmonth as int) as expmonth
        , cast(expyear as int) as expyear

    from source_sales_creditcard
)

select * from renamed
