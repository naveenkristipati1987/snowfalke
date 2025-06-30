{% snapshot customer_snapshot %}
{{
  config(
    target_schema='MASTER_DATA',
    unique_key='c_custkey',
    strategy='check',
    check_cols=['c_name', 'c_nationkey']
  )
}}

SELECT * FROM SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER

{% endsnapshot %}

