-- ============================================================
-- CREATE EXTERNAL TABLES (RAW DATA)
-- ============================================================

-- Location table
CREATE EXTERNAL TABLE IF NOT EXISTS tbl_location (
    location_id INT,
    latitude DOUBLE,
    longitude DOUBLE,
    elevation DOUBLE,
    utc_offset_seconds INT,
    timezone STRING,
    timezone_abbreviation STRING,
    city_name STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/test/data/files/location'
TBLPROPERTIES ('skip.header.line.count'='1');

-- Weather table
CREATE EXTERNAL TABLE IF NOT EXISTS tbl_weather (
    location_id INT,
    date STRING,
    weather_code INT,
    temperature_2m_max DOUBLE,
    temperature_2m_min DOUBLE,
    temperature_2m_mean DOUBLE,
    apparent_temperature_max DOUBLE,
    apparent_temperature_min DOUBLE,
    apparent_temperature_mean DOUBLE,
    daylight_duration BIGINT,
    sunshine_duration BIGINT,
    precipitation_sum DOUBLE,
    rain_sum DOUBLE,
    precipitation_hours DOUBLE,
    wind_speed_10m_max DOUBLE,
    wind_gusts_10m_max DOUBLE,
    wind_direction_10m_dominant DOUBLE,
    shortwave_radiation_sum DOUBLE,
    et0_fao_evapotranspiration DOUBLE,
    sunrise STRING,
    sunset STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/test/data/files/weather'
TBLPROPERTIES ('skip.header.line.count'='1');
