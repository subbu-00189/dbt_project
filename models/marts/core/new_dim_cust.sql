with customers as
(
    select * from {{ref('stg_customers')}}
 
),
orders as
(
select * from {{ref('fact_orders')}}
),
cust_orders as
(
 select customer_id,
 min(order_date) as first_order,
 max(order_date) as recent_order,
 sum(total) as amount,
 count(order_id) as number_of_orders
 from orders
 group by 1
),
final as 
(
select a.customer_id,
       a.first_name,
       a.last_name,
       b.first_order,
       b.recent_order,
       b.amount,
       coalesce(b.number_of_orders,0) as number_of_orders
from customers a left join cust_orders b using(customer_id)
)
select * from final