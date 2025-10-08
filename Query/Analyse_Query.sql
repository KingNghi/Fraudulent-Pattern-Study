

/* 
At what time of day do fraud transactions occur most frequently?
*/

SELECT 
    EXTRACT(HOUR FROM trans_datetime),
    COUNT(transaction_id) 
FROM transaction_info
WHERE  is_fraud = TRUE
GROUP BY EXTRACT(HOUR FROM trans_datetime)
ORDER BY COUNT(transaction_id) DESC


/* 
Which merchant categories more prone to fraud?
*/ 

WITH base AS (
    SELECT 
        mer_info.category,
        CASE WHEN t.is_fraud = TRUE THEN 1 ELSE 0 END AS fraud_flag
    FROM transaction_info t
    LEFT JOIN merchant_location loc 
        ON t.location_id = loc.location_id
    LEFT JOIN merchant_info mer_info 
        ON loc.merchant_id = mer_info.merchant_id
)
SELECT DISTINCT
    category,
    -- total fraud transactions per category
    SUM(fraud_flag) OVER (PARTITION BY category) AS fraud_count,
    -- total transactions per category
    COUNT(*) OVER (PARTITION BY category) AS total_count,
    -- fraud rate = fraud / total
    ROUND(
        100.0 * SUM(fraud_flag) OVER (PARTITION BY category)
        / COUNT(*) OVER (PARTITION BY category),
        2
    ) AS fraud_rate_percent
FROM base
ORDER BY fraud_rate_percent DESC;

/* 
Which certain locations are more prone to fraud?
*/ 

SELECT 
    loc.merch_zipcode,
    COUNT(*) AS fraud_transaction_count
FROM transaction_info t
LEFT JOIN merchant_location loc ON t.location_id = loc.location_id
WHERE is_fraud = TRUE
GROUP BY loc.merch_zipcode
ORDER BY fraud_transaction_count DESC;

/* 
How fraudulent transactions vary across different amount range?
*/

SELECT 
    CASE 
        WHEN amount < 10 THEN '< €10'
        WHEN amount BETWEEN 10 AND 100 THEN '€10–100'
        WHEN amount BETWEEN 100 AND 500 THEN '€100–500'
        ELSE '> €500'
    END AS amount_range,
    COUNT(*) AS total_transaction,
    SUM(CASE WHEN is_fraud THEN 1 ELSE 0 END) AS fraud_transaction,
    ROUND(100.0 * SUM(CASE WHEN is_fraud THEN 1 ELSE 0 END) / COUNT(*), 2) AS fraud_rate
FROM transaction_info
GROUP BY amount_range
ORDER BY amount_range;

