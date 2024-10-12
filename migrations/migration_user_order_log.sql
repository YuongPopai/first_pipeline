alter table staging.user_order_log add column status varchar(100);  
update taging.user_order_log
set status = 'shipped'; -- shipped по умолчанию 