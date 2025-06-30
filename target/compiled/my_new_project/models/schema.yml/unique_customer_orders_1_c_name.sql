
    
    

select
    c_name as unique_field,
    count(*) as n_records

from MASTER_DATA.MASTER_DATA.customer_orders_1
where c_name is not null
group by c_name
having count(*) > 1


