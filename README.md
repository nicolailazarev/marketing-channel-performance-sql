# Marketing Channel Performance Analysis (SQL / BigQuery)

INFO 3401 Portfolio Project – SQL analysis of Google Analytics ecommerce data to evaluate marketing channel performance, conversion rates, revenue impact, and device behavior.

---

## Overview

This project analyzes approximately 12 months of Google Analytics ecommerce session data from the Google Merchandise Store (August 1, 2016 – August 1, 2017). The objective was to evaluate acquisition channel performance, conversion efficiency, revenue contribution, and device-level behavior using SQL in BigQuery.

The dataset contains 903,653 total sessions and includes traffic source, transaction, revenue, and device information.

---

## Dataset

Source: `bigquery-public-data.google_analytics_sample`  
Tables used: `ga_sessions_YYYYMMDD`

The dataset contains session-level traffic source data, transaction counts, revenue (stored in micros), and device information. Revenue values in this analysis were converted from micros to USD by dividing by 1,000,000.

Date range analyzed: August 1, 2016 – August 1, 2017.

---

## Key Findings

### Traffic Acquisition
- Direct traffic generated the highest session volume (~371K sessions).
- Organic Google search was the second largest acquisition channel.
- YouTube referral traffic drove significant session volume but minimal transaction activity.

### Conversion Performance
- Direct traffic converted at 2.47%.
- Google search traffic converted at 1.01%.
- Email-related sources demonstrated strong conversion rates among high-volume channels.

### Revenue Contribution
- Direct traffic generated approximately $1.33M in revenue.
- Google search contributed ~$268K.
- Display advertising (dfa) generated ~$128K.

### Device Behavior
- Desktop users converted at approximately 1.67% and generated ~$1.71M in revenue.
- Mobile users converted at approximately 0.41%.
- Desktop conversion performance was roughly four times higher than mobile.

---

## SQL Techniques Used

- Aggregations (COUNT, SUM)
- GROUP BY and HAVING filters
- SAFE_DIVIDE for conversion rate calculations
- `_TABLE_SUFFIX` date filtering
- Revenue normalization (micros → USD)

---

## Reproduce the Analysis

1. Open Google BigQuery.
2. Use dataset: `bigquery-public-data.google_analytics_sample`.
3. Query tables using: `ga_sessions_*`.
4. Apply date filtering with `_TABLE_SUFFIX` (used throughout this project).
5. Run the SQL files in order:

- [`sql/01_total_sessions.sql`](sql/01_total_sessions.sql)
- [`sql/02_traffic_by_channel.sql`](sql/02_traffic_by_channel.sql)
- [`sql/03_conversion_rate_by_source.sql`](sql/03_conversion_rate_by_source.sql)
- [`sql/04_revenue_by_source.sql`](sql/04_revenue_by_source.sql)
- [`sql/05_device_performance.sql`](sql/05_device_performance.sql)

Revenue conversion used in this project: `revenue_usd = revenue_micro / 1000000`.

---

## Tools

- Google BigQuery
- SQL