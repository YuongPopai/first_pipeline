CREATE TABLE mart.f_customer_retention (
    new_customers_count INT NOT NULL,                     
    returning_customers_count INT NOT NULL,               
    refunded_customer_count INT NOT NULL,                  
    period_name VARCHAR(20) NOT NULL DEFAULT 'weekly',    
    period_id INT NOT NULL,                                
    item_id INT NOT NULL,                                  
    new_customers_revenue DECIMAL(15, 2) NOT NULL,       
    returning_customers_revenue DECIMAL(15, 2) NOT NULL,  
    customers_refunded INT NOT NULL,                      
    PRIMARY KEY (period_id)                       
);