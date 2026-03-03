-- Query 2: Traffic by Channel (Source / Medium)
-- Purpose: Identify the primary acquisition channels driving session volume.
-- Date Range: August 1, 2016 – August 1, 2017
-- Result (top channels):
--   (direct) / (none): 371,467 sessions
--   google / organic: 227,668 sessions
--   youtube.com / referral: 212,602 sessions

SELECT
  trafficSource.source AS source,
  trafficSource.medium AS medium,
  COUNT(*) AS sessions
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE
  _TABLE_SUFFIX BETWEEN '20160801' AND '20170801'
GROUP BY
  source, medium
ORDER BY
  sessions DESC
LIMIT 15;