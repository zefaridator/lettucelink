import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:lettucelink/models/Business/Evapotranspiration.dart';

Future <Evapotranspiration> fetchEvp(double latitude , double longitude) async 
{
  final response = await http
                  .get(Uri.parse('https://europe-west1-irrigaia.cloudfunctions.net/get_evapo?lon=$longitude&lat=$latitude'));
  if (response.statusCode == 200 )
      {
        // If the server did return a 200 OK response,
    // then parse the JSON.
    return Evapotranspiration.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      }
  else{
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load EVP');
  }

}