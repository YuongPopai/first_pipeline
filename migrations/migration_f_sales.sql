create temp table temp_f_sales as
select 
    date_id, 
    item_id, 
    customer_id, 
    city_id,
    quantity,
    payment_amount
from mart.f_sales;

truncate table mart.f_sales;

alter table mart.f_sales add column status VARCHAR(100);  

insert into mart.f_sales (date_id, item_id, customer_id, city_id, quantity, payment_amount, status)
select 
    date_id, 
    item_id, 
    customer_id, 
    city_id,
    quantity,
    payment_amount,
    'shipped' as status  -- shipped по умолчанию
from temp_f_sales;

drop table temp_f_sales;