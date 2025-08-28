with 
    creditcard as (
        select * 
        from {{ source('erp', 'sales_creditcard') }}
    )
    , renamed as (
        select
            cast(creditcardid as int) as creditcard_pk
            , cast(cardtype as varchar) as cardtype
        from creditcard
    )

select * from renamed
