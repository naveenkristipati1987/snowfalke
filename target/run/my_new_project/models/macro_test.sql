
  create or replace   view MASTER_DATA.MASTER_DATA.macro_test
  
  
  
  
  as (
    with micro_test as (
SELECT
  l.l_orderkey,
  
  (l.l_extendedprice * (1 - l.l_discount))
 AS discounted_price
FROM SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.LINEITEM l)

select * from micro_test
  );

