-- Query 3: Conversion Rate by Traffic Source
-- Purpose: Compare transaction conversion rates across acquisition sources.
-- Note: Uses a minimum session threshold to avoid low-volume noise.
-- Date Range: August 1, 2016 – August 1, 2017
-- Threshold: sources with >= 1,000 sessions
-- Result (selected):
--   mail.google.com: 4.80%
--   groups.google.com: 3.71%
--   (direct): 2.47%
--   google: 1.01%
--   youtube.com: ~0.005%

SELECT
  trafficSource.source AS source,
  COUNT(*) AS sessions,
  SUM(totals.transactions) AS transactions,
  SAFE_DIVIDE(SUM(totals.transactions), COUNT(*)) AS conversion_rate
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE
  _TABLE_SUFFIX BETWEEN '20160801' AND '20170801'
GROUP BY
  source
HAVING
  COUNT(*) >= 1000
ORDER BY
  conversion_rate DESC;