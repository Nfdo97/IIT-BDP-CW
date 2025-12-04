-- =============================================================
-- ANALYSIS 2:
-- Average Evapotranspiration by Season (Agro Seasons)
-- Seasons:
--   1. Maha Season : September (9) to March (3)
--   2. Yala Season : April (4) to August (8)
-- =============================================================

SELECT
    city_name,
    season,
    avg_evapotranspiration
FROM 
(
    SELECT
        l.city_name,
        CASE 
            WHEN EXTRACT(MONTH FROM w.date) BETWEEN 4 AND 8 THEN 'Yala'
            ELSE 'Maha'
        END AS season,
        ROUND(AVG(w.evapotranspiration), 2) AS  avg_evapotranspiration
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
