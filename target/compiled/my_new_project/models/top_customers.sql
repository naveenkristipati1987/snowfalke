SELECT
  c.c_name,
  SUM(o.o_totalprice) AS total_revenue
FROM SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER c
JOIN SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS o
  ON c.c_custkey = o.o_custkey
GROUP BY c.c_name
ORDER BY total_revenue DESC
LIMIT 10