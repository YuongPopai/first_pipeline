create temp table temp_user_order_log as
select 
    uniq_id, 
    date_time, 
    city_id, 
    city_name, 
    customer_id, 
    first_name, 
    last_name, 
    item_id,
    item_name, 
    quantity, 
    payment_amount
from staging.user_order_log;

truncate table staging.user_order_log;

alter table staging.user_order_log add column status varchar(100);  

insert into staging.user_order_log (uniq_id, date_time, city_id, city_name, customer_id, first_name, last_name, item_id, item_name, quantity, payment_amount, status)
select 
    uniq_id, 
    date_time, 
    city_id, 
    city_name, 
    customer_id, 
    first_name, 
    last_name, 
    item_id, 
    item_name, 
    quantity, 
    payment_amount, 
    'shipped' AS status  --shipped по умолчанию
from temp_user_order_log;

drop table temp_user_order_log;