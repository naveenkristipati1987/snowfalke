with data_of_item as (
SELECT
  l.l_orderkey,
  l.l_linenumber,
  l.l_quantity,
  l.l_extendedprice,
  p.p_name,
  s.s_name
FROM SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.LINEITEM l
JOIN SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.PART p ON l.l_partkey = p.p_partkey
JOIN SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.SUPPLIER s ON l.l_suppkey = s.s_suppkey)

select * from data_of_item