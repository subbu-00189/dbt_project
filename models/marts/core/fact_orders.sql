with orders as
(
    select *
    from {{ref('stg_orders')}}
),
payments as
(
  
    select *
        from {{ref('stg_payments')}}
),
order_pament as
(
 select order_id,
        sum(case 
              when status='success' then amount
            end ) as total_amount_spent
        from payments
          -- from dbt_schema.raw_payments
        group by 1
),
final as
(
select a.order_id as order_id,
       a.customer_id as customer_id,
       a.order_date as order_date,
       coalesce(b.total_amount_spent,0) as total
from orders a left join 
     order_pament b using(order_id)
)
select * from final
