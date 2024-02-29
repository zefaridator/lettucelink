
import 'dart:convert';
import 'package:lettucelink/models/Business/AgroWeather.dart';

Future<Map<String, dynamic>> fetchWeather(double lat, double lon) async {
  try {
    final responseDaily = await AgroWeather(latitude: lat, longitude: lon).dataDaily;
    final responseHourly = await AgroWeather(latitude: lat, longitude: lon).dataHourly;

    var jsonDaily = jsonEncode(responseDaily);
    var jsonHourly = jsonEncode(responseHourly);

    return {
      'daily': jsonDecode(jsonDaily),
      'hourly': jsonDecode(jsonHourly),
    };
  } catch (e) {
    // Gérer les erreurs, par exemple, imprimer un message d'erreur ou lancer une exception
    print('Erreur lors de la récupération des données météorologiques: $e');
    rethrow;
  }
}
