with 
    source_person_person as (
    select * 
    from {{ source('erp', 'person_person') }}
),

renamed as (
    select
        cast(businessentityid as int) as person_pk
        , cast(persontype as varchar) as persontype
        , cast(firstname as varchar) as firstname
        , cast(middlename as varchar) as middlename
        , cast(lastname as varchar) as lastname
        , cast(emailpromotion as int) as emailpromotion
        , cast(additionalcontactinfo as varchar) as additionalcontactinfo
    from source_person_person
)

select * from renamed
