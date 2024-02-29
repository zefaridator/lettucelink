import 'dart:convert';
import '../../services/weather_api_service.dart';

Future<void> main() async {
  double lat = 43.6;
  double lon = 1.34;

  try {
    // Appel à la fonction fetchWeather
    Map<String, dynamic> weatherData = await fetchWeather(lat, lon);

    // Utilisez les données météorologiques comme vous le souhaitez
    var jsonStringDaily = jsonEncode(weatherData['daily']);
    var jsonStringHourly = jsonEncode(weatherData['hourly']);

    print(jsonStringDaily);
    print(jsonStringHourly);
  } catch (e) {
    // Gérer les erreurs, par exemple, imprimer un message d'erreur ou lancer une exception
    print('Erreur lors de la récupération des données météorologiques: $e');
  }
}