with customers as
(
    select id as customer_id,
           first_name,
           last_name
    from {{source('jaffle','RAW_CUSTOMERS')}}
)

select * from customers