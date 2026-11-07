USE netflix_churn;

CREATE OR REPLACE VIEW vw_churn_scored AS
SELECT c.*, s.churn_prob, s.risk_tier, s.expected_loss
FROM customers c JOIN churn_scores s USING (customer_id);

-- Sanity check: actual churn should rise from Low to High
SELECT risk_tier,
       COUNT(*)                     AS n,
       ROUND(100*AVG(churned),1)    AS actual_churn_pct,
       ROUND(SUM(expected_loss),0)  AS expected_loss
FROM vw_churn_scored
GROUP BY risk_tier
ORDER BY FIELD(risk_tier, 'Low', 'Medium', 'High');

SELECT customer_id, subscription_type, device, region, last_login_days,
       mrr, ROUND(churn_prob,2) AS churn_prob, ROUND(expected_loss,2) AS expected_loss
FROM vw_churn_scored
WHERE churned = 0 AND risk_tier = 'High'
ORDER BY expected_loss DESC
LIMIT 25;