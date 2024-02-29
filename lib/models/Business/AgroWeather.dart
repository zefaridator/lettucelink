import 'package:open_meteo/open_meteo.dart';

class AgroWeather {
  final double latitude;
  final double longitude;
  final Weather _client ;
 
  AgroWeather({required this.latitude, required this.longitude}) : _client =  Weather(
      latitude:  latitude,
      longitude: longitude ,
       temperature_unit: TemperatureUnit.celsius);


  Future <Map<String,dynamic>> get dataHourly async {
      var paramsHourly = [ Hourly.temperature_2m , Hourly.apparent_temperature,Hourly.evapotranspiration, Hourly.rain] ;
      return await _client.raw_request(hourly: paramsHourly );
  }
  
  Future <Map<String,dynamic>> get dataDaily async {
      var paramsDaily = [Daily.precipitation_sum, Daily.et0_fao_evapotranspiration];
      return await _client.raw_request(daily: paramsDaily );
  }
}
