with payments as
(
    select id as payment_id,
        order_id ,
        status,
         {{  to_dollars('amount') }} as amount,
         created as created_at
    from {{source('stripe','RAW_PAYMENTS')}}

)
select * from payments