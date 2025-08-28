with 
    person as (
        select * 
        from {{ source('erp', 'person_person') }}
    )
    , renamed as (
        select
            cast(businessentityid as int) as person_pk
            , cast(persontype as varchar) as persontype
            , firstname || ' ' || lastname AS person_full_name
        from person
    )

select * from renamed
