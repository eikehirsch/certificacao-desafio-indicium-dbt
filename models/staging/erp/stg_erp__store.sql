with 
    source_store as (
    select * 
    from {{ source('erp', 'sales_store') }}
),

renamed as (
    select
        cast(businessentityid as int) as store_pk
        , cast(salespersonid as int) as salesperson_fk
        , cast(name as varchar) as store_name
    from source_store
)

select * from renamed
