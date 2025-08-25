with 
    source_address as (
    select * 
    from {{ source('erp', 'person_address') }}
),

renamed as (
    select
        cast(addressid as int) as address_pk
        , cast(stateprovinceid as int) as stateprovince_fk
        , cast(addressline1 as varchar) as addressline1
        , cast(addressline2 as varchar) as addressline2
        , cast(city as varchar) as city_name
    from source_address
)

select * from renamed
