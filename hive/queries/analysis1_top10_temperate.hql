SELECT
    ranked_temp,
    city_name,
    temperature
FROM 
(
    SELECT 
        l.city_name,
        ROUND(w.temperature_2m_max, 2) AS temperature,
        DENSE-RANK() OVER (ORDER BY w.temperature_2m_max  DESC) AS ranked_temp
 FROM tbl_weather w 
 JOIN tbl_location l
   ON w.location_id = l.location_id
WHERE w.temperature_2m_max IS NOT NULL
) t
WHERE t.ranked_temp < = 10;

