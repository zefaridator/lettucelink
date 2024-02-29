// ignore_for_file: non_constant_identifier_names

class Evapotranspiration {
  final double lat;
  final double lon ;
  final double evapotranspiration_mm ;
  final double average_distance_km;
  const Evapotranspiration({required this.lat , required this.lon , required this.evapotranspiration_mm , required this.average_distance_km});

  factory Evapotranspiration.fromJson(Map<String, dynamic> json) {
    if (json['lat'] == null || json['lon'] == null || json['evapotranspiration_mm'] == null || json['average_distance_km'] == null) {
      throw const FormatException('Failed to load evapotranspiration.');
    }
    return Evapotranspiration(
      lat: json['lat'] as double,
      lon: json['lon'] as double,
      evapotranspiration_mm: json['evapotranspiration_mm'] as double,
      average_distance_km: json['average_distance_km'] as double,
    );
  }
}
