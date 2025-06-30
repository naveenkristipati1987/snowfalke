SELECT
  c.c_custkey,
  c.c_name,
  COUNT(o.o_orderkey) AS total_orders,
  SUM(o.o_totalprice) AS total_revenue
FROM SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER c
JOIN SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS o
  ON c.c_custkey = o.o_custkey
GROUP BY c.c_custkey, c.c_name
