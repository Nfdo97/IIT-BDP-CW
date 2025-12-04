-- =============================================================
-- ANALYSIS 2:
-- Average Evapotranspiration by Season (Agro Seasons)
-- Seasons:
--   1. Maha Season : September (9) to March (3)
--   2. Yala Season : April (4) to August (8)
-- =============================================================

-- 1. Create table for results
CREATE TABLE IF NOT EXISTS avg_evapo_season_district (
    district_name STRING,
    season STRING,
    avg_evapotranspiration DOUBLE
)
STORED AS PARQUET;

-- 2. Insert results to the table
INSERT OVERWRITE TABLE avg_evapo_season_district
SELECT
    city_name,
    season,
    avg_evapotranspiration
FROM (
    SELECT
        l.city_name,
        CASE 
            WHEN EXTRACT(MONTH FROM w.date) BETWEEN 4 AND 8 THEN 'Yala'
            ELSE 'Maha'
        END AS season,
        ROUND(AVG(w.evapotranspiration), 2) AS avg_evapotranspiration
    FROM tbl_weather w
    JOIN tbl_location l
        ON w.location_id = l.location_id
      GROUP BY 
        l.city_name,
        CASE 
            WHEN EXTRACT(MONTH FROM w.date) BETWEEN 4 AND 8 THEN 'Yala'
            ELSE 'Maha'
        END
) t
ORDER BY city_name, season;

-- 3. Display first rows
SELECT * FROM avg_evapo_season_district LIMIT 20;
