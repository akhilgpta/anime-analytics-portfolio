-- =========================================================
-- Anime Analytics - DuckDB Queries
-- Source CSV: data/anime_tv_series_dataset.csv
-- Run in DuckDB CLI from repo root:
--   duckdb
--   .read sql/queries.sql
-- =========================================================

-- Create or refresh table from CSV
CREATE OR REPLACE TABLE anime AS
SELECT *
FROM read_csv_auto('data/anime_tv_series_dataset.csv');

-- Quick peek
SELECT * FROM anime LIMIT 10;

-- 1) Overall summary: rows, year range, avg rating, median popularity
SELECT
  COUNT(*)                          AS n_anime,
  MIN(start_year)                   AS year_min,
  MAX(start_year)                   AS year_max,
  ROUND(AVG(score_avg), 2)          AS avg_rating,
  MEDIAN(popularity)                AS median_popularity
FROM anime;

-- 2) Releases per year
SELECT
  start_year,
  COUNT(*) AS releases
FROM anime
GROUP BY start_year
ORDER BY start_year;

-- 3) Releases per decade
WITH t AS (
  SELECT (start_year/10)*10 AS decade
  FROM anime
  WHERE start_year IS NOT NULL
)
SELECT decade, COUNT(*) AS releases
FROM t
GROUP BY decade
ORDER BY decade;

-- 4) Average rating by genre (require at least 30 series for stability)
SELECT
  genre_main,
  COUNT(*)                              AS n_series,
  ROUND(AVG(score_avg), 2)              AS avg_rating
FROM anime
GROUP BY genre_main
HAVING COUNT(*) >= 30
ORDER BY avg_rating DESC;

-- 5) Top 10 studios by average rating (require >= 10 series)
SELECT
  studio,
  COUNT(*)                         AS n_series,
  ROUND(AVG(score_avg), 2)         AS avg_rating
FROM anime
GROUP BY studio
HAVING COUNT(*) >= 10
ORDER BY avg_rating DESC, n_series DESC
LIMIT 10;

-- 6) Popularity vs rating (for scatter plot summary)
SELECT
  ROUND(AVG(score_avg), 2) AS avg_rating_overall,
  ROUND(AVG(popularity),0) AS avg_popularity_overall,
  CORR(score_avg, popularity) AS corr_rating_popularity
FROM anime;

-- 7) Top 10 most popular titles (with their rating)
SELECT
  title_english,
  popularity,
  ROUND(score_avg, 2) AS score_avg
FROM anime
ORDER BY popularity DESC
LIMIT 10;

-- 8) Rating distribution buckets (for histogram-style table)
WITH b AS (
  SELECT
    CASE
      WHEN score_avg < 5 THEN '<5.0'
      WHEN score_avg < 6 THEN '5.0–5.9'
      WHEN score_avg < 7 THEN '6.0–6.9'
      WHEN score_avg < 8 THEN '7.0–7.9'
      WHEN score_avg < 9 THEN '8.0–8.9'
      ELSE '9.0+' END AS rating_bucket
  FROM anime
)
SELECT rating_bucket, COUNT(*) AS n
FROM b
GROUP BY rating_bucket
ORDER BY
  CASE rating_bucket
    WHEN '<5.0' THEN 1
    WHEN '5.0–5.9' THEN 2
    WHEN '6.0–6.9' THEN 3
    WHEN '7.0–7.9' THEN 4
    WHEN '8.0–8.9' THEN 5
    ELSE 6 END;

-- 9) Genres with strongest popularity (require >= 30 series)
SELECT
  genre_main,
  COUNT(*)                       AS n_series,
  ROUND(AVG(popularity), 0)      AS avg_popularity,
  ROUND(AVG(score_avg), 2)       AS avg_rating
FROM anime
GROUP BY genre_main
HAVING COUNT(*) >= 30
ORDER BY avg_popularity DESC;

-- 10) Time trend: average rating by decade (stability: >= 30 series)
WITH t AS (
  SELECT (start_year/10)*10 AS decade, score_avg
  FROM anime
  WHERE start_year IS NOT NULL
)
SELECT
  decade,
  COUNT(*)                       AS n_series,
  ROUND(AVG(score_avg), 2)       AS avg_rating
FROM t
GROUP BY decade
HAVING COUNT(*) >= 30
ORDER BY decade;
