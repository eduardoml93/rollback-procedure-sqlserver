/****** Script do comando SelectTopNRows de SSMS  ******/

SELECT * FROM [meubanco].[dbo].[clima_ppta];

USE [meubanco];
GO

-- Iniciar a transação
BEGIN TRANSACTION;

-- Realizar a operação de inserção
INSERT INTO dbo.clima_ppta
(
    city, latitude, longitude, weather_condition, weather_description, temperature, feels_like, temp_min, temp_max, pressure, humidity, visibility, wind_speed, wind_deg, wind_gust, cloudiness, country
)
VALUES
(
    'Nome da Cidade2', -- city
    12.34,            -- latitude
    -56.78,           -- longitude
    'Clear',          -- weather_condition
    'Clear sky',      -- weather_description
    25.0,             -- temperature
    20.0,             -- feels_like
    15.0,             -- temp_min
    30.0,             -- temp_max
    1013,             -- pressure
    50,               -- humidity
    10000,            -- visibility
    2.1,              -- wind_speed
    180,              -- wind_deg
    3.5,              -- wind_gust
    0,                -- cloudiness
    'País'            -- country
);

-- Revertendo a transação
ROLLBACK TRANSACTION;
GO
