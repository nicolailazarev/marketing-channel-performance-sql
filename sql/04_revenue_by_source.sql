-- Query 4: Revenue by Traffic Source
-- Purpose: Identify which acquisition sources generate the most revenue.
-- Note: Revenue is stored in micros, so divide by 1,000,000 to convert to USD.
-- Date Range: August 1, 2016 – August 1, 2017
-- Result (top sources):
--   (direct): $1,332,591.98
--   google: $268,335.35
--   dfa: $128,787.15

SELECT
  trafficSource.source AS source,
  SUM(totals.totalTransactionRevenue) / 1000000 AS revenue_usd
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE
  _TABLE_SUFFIX BETWEEN '20160801' AND '20170801'
  AND totals.totalTransactionRevenue IS NOT NULL
GROUP BY
  source
ORDER BY
  revenue_usd DESC
LIMIT 15;