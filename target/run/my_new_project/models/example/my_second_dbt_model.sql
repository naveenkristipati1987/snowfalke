
  
    

create or replace transient table MASTER_DATA.MASTER_DATA.my_second_dbt_model
    
    
    
    as (-- Use the `ref` function to select from other models

select *
from MASTER_DATA.MASTER_DATA.my_first_dbt_model
where id = 1
    )
;


  