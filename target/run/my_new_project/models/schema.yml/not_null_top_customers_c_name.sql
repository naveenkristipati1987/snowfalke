
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select c_name
from MASTER_DATA.MASTER_DATA.top_customers
where c_name is null



  
  
      
    ) dbt_internal_test