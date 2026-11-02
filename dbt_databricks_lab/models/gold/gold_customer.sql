WITH DEDUPLICATED AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY SrcUpdatedDate DESC) AS row_num
    FROM
        {{ source('bronze', 'customer') }}
)
SELECT 
    customer_id,
    customer_name,
    customer_email,
    is_current,
    SrcUpdatedDate
FROM
    DEDUPLICATED
WHERE
    row_num = 1
