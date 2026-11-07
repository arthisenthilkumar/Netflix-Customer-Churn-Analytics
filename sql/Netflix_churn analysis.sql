CREATE DATABASE IF NOT EXISTS netflix_churn;
USE netflix_churn;

CREATE TABLE customers (
    customer_id             VARCHAR(50) PRIMARY KEY,
    age                     INT,
    gender                  VARCHAR(20),
    subscription_type       VARCHAR(20),
    watch_hours             DECIMAL(10,2),
    last_login_days         INT,
    region                  VARCHAR(30),
    device                  VARCHAR(20),
    monthly_fee             DECIMAL(6,2),
    churned                 TINYINT,
    payment_method          VARCHAR(30),
    number_of_profiles      INT,
    avg_watch_time_per_day  DECIMAL(6,2),
    favorite_genre          VARCHAR(30),
    flag_watchtime_gt24     TINYINT,
    mrr                     DECIMAL(6,2),
    age_group               VARCHAR(10),
    recency_bucket          VARCHAR(10),
    engagement_band         VARCHAR(10),
    revenue_at_risk         DECIMAL(6,2),
    is_bad_watchtime          INT
);


SELECT COUNT(*) AS total_rows FROM customers;          -- expect 5000
SELECT * FROM customers LIMIT 5;
SELECT COUNT(*) AS nulls_in_target FROM customers WHERE churned IS NULL;  -- expect 0


-- 1. Headline KPIs
SELECT COUNT(*)                                            AS customers,
       ROUND(100 * AVG(churned), 1)                        AS churn_pct,
       ROUND(SUM(mrr), 0)                                  AS total_mrr,
       ROUND(SUM(CASE WHEN churned = 1 THEN mrr END), 0)   AS churned_mrr,
       ROUND(100 * SUM(CASE WHEN churned = 1 THEN mrr END) / SUM(mrr), 1) AS mrr_churn_pct
FROM customers;

-- 2. Churn by plan, with sample size and revenue
SELECT subscription_type,
       COUNT(*)                      AS n,
       ROUND(100 * AVG(churned), 1)  AS churn_pct,
       ROUND(SUM(mrr), 0)            AS mrr
FROM customers
GROUP BY subscription_type
ORDER BY churn_pct DESC;

-- 3. Recency vs churn
SELECT recency_bucket,
       COUNT(*)                      AS n,
       ROUND(100 * AVG(churned), 1)  AS churn_pct
FROM customers
GROUP BY recency_bucket
ORDER BY FIELD(recency_bucket, '0-7', '8-14', '15-30', '30+');

-- 4. Engagement band vs churn
SELECT engagement_band,
       COUNT(*)                      AS n,
       ROUND(100 * AVG(churned), 1)  AS churn_pct,
       ROUND(AVG(watch_hours), 1)    AS avg_watch_hours
FROM customers
GROUP BY engagement_band
ORDER BY FIELD(engagement_band, 'Low', 'Medium', 'High', 'Power');

-- 5. Highest-risk segments (CTE + window function; ignores tiny segments)
WITH seg AS (
    SELECT region, subscription_type, device,
           COUNT(*)       AS n,
           AVG(churned)   AS churn_rate,
           SUM(mrr)       AS mrr
    FROM customers
    GROUP BY region, subscription_type, device
    HAVING COUNT(*) >= 30
)
SELECT region, subscription_type, device, n,
       ROUND(100 * churn_rate, 1) AS churn_pct,
       ROUND(mrr, 0)              AS mrr,
       RANK() OVER (ORDER BY churn_rate DESC) AS risk_rank
FROM seg
ORDER BY risk_rank
LIMIT 10;

-- 6. Share of lost MRR by plan
SELECT subscription_type,
       ROUND(SUM(CASE WHEN churned = 1 THEN mrr END), 0) AS lost_mrr,
       ROUND(100 * SUM(CASE WHEN churned = 1 THEN mrr END)
             / SUM(SUM(CASE WHEN churned = 1 THEN mrr END)) OVER (), 1) AS pct_of_loss
FROM customers
GROUP BY subscription_type;

-- 7. Churn by payment method
SELECT payment_method,
       COUNT(*)                      AS n,
       ROUND(100 * AVG(churned), 1)  AS churn_pct
FROM customers
GROUP BY payment_method
ORDER BY churn_pct DESC;

-- 8. Churn by region, ranked
SELECT region,
       COUNT(*)                                        AS n,
       ROUND(100 * AVG(churned), 1)                    AS churn_pct,
       DENSE_RANK() OVER (ORDER BY AVG(churned) DESC)  AS churn_rank
FROM customers
GROUP BY region;

-- 9. Active (not yet churned) customers who look at risk: inactive 30+ days, low engagement
SELECT customer_id, subscription_type, device, region,
       last_login_days, watch_hours, mrr
FROM customers
WHERE churned = 0
  AND last_login_days > 30
  AND engagement_band = 'Low'
ORDER BY mrr DESC, last_login_days DESC
LIMIT 50;

-- 10. Churn pattern by device within each plan (window: compare to plan average)
SELECT subscription_type, device,
       COUNT(*)                                              AS n,
       ROUND(100 * AVG(churned), 1)                          AS churn_pct,
       ROUND(100 * (AVG(churned)
            - AVG(AVG(churned)) OVER (PARTITION BY subscription_type)), 1) AS diff_vs_plan_avg
FROM customers
GROUP BY subscription_type, device
ORDER BY subscription_type, churn_pct DESC;

