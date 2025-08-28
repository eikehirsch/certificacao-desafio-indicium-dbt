/*
    This test ensures that the gross sales for years between 1996 and 1998 match
    the audited accounting value: R$ 12.646.112,16
*/

with sales_2011 as (
    select sum(gross_total) as total
    from {{ ref('int_fact__metrics') }}
    where orderdate between '2011-01-01' and '2011-12-31'
)

select *
from sales_2011
where total not between 12646112.12 and 12646112.20
