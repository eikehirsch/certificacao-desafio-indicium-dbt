with 
    source_sales_salesorderheader as (
    select * 
    from {{ source('erp', 'sales_salesorderheader') }}

),

renamed as (
    select
        cast(salesorderid as int) as sales_salesorderheader_pk
        , cast(salespersonid as int) as salesperson_fk
        , cast(customerid as int) as customer_fk
        , cast(territoryid as int) as territory_fk
        , cast(billtoaddressid as int) as billtoaddress_fk
        , cast(shiptoaddressid as int) as shiptoaddress_fk
        , cast(shipmethodid as int) as shipmethod_fk
        , cast(creditcardid as int) as creditcard_fk
        , cast(currencyrateid as int) as currencyrate_fk
        , cast(orderdate as date) as orderdate
        , cast(duedate as date) as duedate
        , cast(shipdate as date) as shipdate
        , cast(modifieddate as date) as modifieddat
        , cast(revisionnumber as int) as revisionnumber
        , cast(status as int) as status
        , cast(onlineorderflag as boolean) as onlineorderflag
        , cast(purchaseordernumber as varchar) as purchaseordernumber
        , cast(accountnumber as varchar) as accountnumber
        , cast(subtotal as numeric(18,2)) as subtotal
        , cast(taxamt as numeric(18,2)) as taxamt
        , cast(freight as numeric(18,2)) as freight
        , cast(totaldue as numeric(18,2)) as totaldue
        , cast(comment as varchar) as comment
        , cast(rowguid as varchar) as rowguid
        , cast(creditcardapprovalcode as varchar) as creditcardapprovalcode
    from source_sales_salesorderheader
)

select * from renamed
