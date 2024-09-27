with payments as
(
    select id as payment_id,
        order_id ,
        status,
         truncate(amount/100) as amount,
         created as created_at
    from {{source('jaffle','RAW_PAYMENTS')}}

)
select * from payments