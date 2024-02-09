USE [meubanco];
GO

-- Chamar o procedimento armazenado com os valores para inserção
EXEC InsertCityWithRollback
    @cityName = 'NomedaCidade124',
    @latitude =  12.34,
    @longitude = -56.78,
    @weatherCondition = 'Clear',
    @weatherDescription = 'Clear sky',
    @temperature =  25.0,
    @feelsLike =  20.0,
    @tempMin =  15.0,
    @tempMax =  30.0,
    @pressure =  1013,
    @humidity =  50,
    @visibility =  10000,
    @windSpeed =  2.1,
    @windDeg =  180,
    @windGust =  3.5,
    @cloudiness =  0,
    @country = 'País';
GO
