alter table mart.f_sales add column status VARCHAR(100);  
update mart.f_sales
set status = 'shipped'; -- shipped по умолчанию 