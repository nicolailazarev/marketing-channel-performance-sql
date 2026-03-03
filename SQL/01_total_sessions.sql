-- Query 1: Total Sessions
-- Purpose: Establish total session volume for the analysis period.
-- Date Range: August 1, 2016 – August 1, 2017
-- Result: 903,653 total sessions

SELECT
  COUNT(*) AS total_sessions
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE
  _TABLE_SUFFIX BETWEEN '20160801' AND '20170801';