USE [meubanco]
GO
/****** Object:  StoredProcedure [dbo].[InsertCityWithRollback]    Script Date: 09/02/2024 16:20:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[InsertCityWithRollback]
    @cityName VARCHAR(MAX),
    @latitude FLOAT,
    @longitude FLOAT,
    @weatherCondition VARCHAR(MAX),
    @weatherDescription VARCHAR(MAX),
    @temperature FLOAT,
    @feelsLike FLOAT,
    @tempMin FLOAT,
    @tempMax FLOAT,
    @pressure BIGINT,
    @humidity BIGINT,
    @visibility BIGINT,
    @windSpeed FLOAT,
    @windDeg BIGINT,
    @windGust FLOAT,
    @cloudiness BIGINT,
    @country VARCHAR(MAX)
AS
BEGIN
    -- Iniciar a transação
    BEGIN TRANSACTION;

    -- Verificar se o nome da cidade já existe
    IF NOT EXISTS (SELECT  1 FROM dbo.clima_ppta WHERE city = @cityName)
    BEGIN
        -- Se a cidade não existir, realizar a inserção
        INSERT INTO dbo.clima_ppta
        (
            city, latitude, longitude, weather_condition, weather_description, temperature, feels_like, temp_min, temp_max, pressure, humidity, visibility, wind_speed, wind_deg, wind_gust, cloudiness, country
        )
        VALUES
        (
            @cityName, -- city
            @latitude, -- latitude
            @longitude, -- longitude
            @weatherCondition, -- weather_condition
            @weatherDescription, -- weather_description
            @temperature, -- temperature
            @feelsLike, -- feels_like
            @tempMin, -- temp_min
            @tempMax, -- temp_max
            @pressure, -- pressure
            @humidity, -- humidity
            @visibility, -- visibility
            @windSpeed, -- wind_speed
            @windDeg, -- wind_deg
            @windGust, -- wind_gust
            @cloudiness, -- cloudiness
            @country -- country
        );
        
        -- Confirmar a transação
        COMMIT TRANSACTION;
    END
    ELSE
    BEGIN
        -- Se a cidade já existir, realizar o rollback
        ROLLBACK TRANSACTION;
    END
END;

