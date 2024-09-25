with customers as
(
    SELECT id,
        first_name,
        last_name
    FROM  dbt_schema.RAW_CUSTOMERS
)
select * from customers