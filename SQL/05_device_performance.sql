-- Query 5: Device Performance
-- Purpose: Compare sessions, conversion rate, and revenue by device category.
-- Date Range: August 1, 2016 – August 1, 2017
-- Result:
--   Desktop: 664,479 sessions | 1.67% conversion | ~$1.71M revenue
--   Mobile:  208,725 sessions | 0.41% conversion | ~$56.9K revenue
--   Tablet:   30,449 sessions | 0.58% conversion | ~$11.4K revenue

SELECT
  device.deviceCategory AS device,
  COUNT(*) AS sessions,
  SUM(totals.transactions) AS transactions,
  SAFE_DIVIDE(SUM(totals.transactions), COUNT(*)) AS conversion_rate,
  SUM(totals.totalTransactionRevenue) / 1000000 AS revenue_usd
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE
  _TABLE_SUFFIX BETWEEN '20160801' AND '20170801'
GROUP BY
  device
ORDER BY
  sessions DESC;