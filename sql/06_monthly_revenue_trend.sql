-- Query 6: Monthly Revenue Trend
-- Purpose: Analyze revenue, sessions, and conversion rate trends over time.
-- Date Range: August 1, 2016 – August 1, 2017
-- Revenue stored in micros; converted to USD.
--
-- Key Observation:
-- April 2017 generated the highest revenue (~$222,768).
-- December 2016 had the highest conversion rate (~1.83%).
-- Revenue variation appears driven more by transaction volume than strong seasonal spikes.

SELECT
  FORMAT_DATE('%Y-%m', PARSE_DATE('%Y%m%d', date)) AS year_month,
  COUNT(*) AS sessions,
  SUM(totals.transactions) AS transactions,
  SAFE_DIVIDE(SUM(totals.transactions), COUNT(*)) AS conversion_rate,
  SUM(totals.totalTransactionRevenue) / 1000000 AS revenue_usd
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE
  _TABLE_SUFFIX BETWEEN '20160801' AND '20170801'
GROUP BY
  year_month
ORDER BY
  year_month;