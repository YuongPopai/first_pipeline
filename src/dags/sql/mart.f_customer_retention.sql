insert into mart.f_customer_retention (new_customers_count, returning_customers_count, refunded_customer_count, period_name, period_id, item_id, new_customers_revenue, returning_customers_revenue, customers_refunded)
select 
    count(distinct case 
        when order_count = 1 then customer_id 
    end) as new_customers_count,
    
    count(distinct case 
        when order_count > 1 then customer_id 
    end) as returning_customers_count,
    
    count(distinct case 
        when status = 'refunded' then customer_id 
    end) as refunded_customer_count,
    
    'weekly' as period_name,
    extract(WEEK from date_actual) as period_id,
    item_id,
    
    SUM(case 
        when order_count = 1 then payment_amount 
        else 0 
    end) as new_customers_revenue,
    
    SUM(case 
        when order_count > 1 then payment_amount 
        else 0 
    end) as returning_customers_revenue,
    
    count(case 
        when status = 'refunded' then 1 
    end) as customers_refunded
    
from (
    SELECT 
        customer_id,
        item_id,
        payment_amount,
        count(*) as order_count,
        status as status,
        date_actual
    from mart.f_sales f
    join mart.d_calendar c on f.date_id = c.date_id
    group by customer_id, item_id, payment_amount, status, date_actual
) as orders
group by period_id, orders.item_id;
