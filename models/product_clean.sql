-- models/product_clean.sql
{{ config(
    materialized='incremental',
    schema='MASTER_DATA',
    alias='S_PROD_INT_CLEAN',
    unique_key='ROW_ID'
) }}

WITH ranked_products AS (
    SELECT
        ROW_ID,
        UPPER(NAME) AS PRODUCT_NAME,
        PART_NUM,
        PROD_TYPE_CD,
        ACTIVE_FLG,
        CREATED,
        LAST_UPD,
        ROW_NUMBER() OVER (
            PARTITION BY ROW_ID
            ORDER BY LAST_UPD DESC
        ) AS row_rank
    FROM {{ source('MASTER_DATA', 'S_PROD_INT') }}
    WHERE ACTIVE_FLG = 'Y'
    {% if is_incremental() %}
      AND LAST_UPD > (SELECT MAX(LAST_UPD) FROM {{ this }})
    {% endif %}
)

SELECT
    ROW_ID,
    PRODUCT_NAME,
    PART_NUM,
    PROD_TYPE_CD,
    CREATED,
    LAST_UPD
FROM ranked_products
WHERE row_rank = 1
