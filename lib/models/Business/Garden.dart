// garden class
// lat , lon 
// country
// postal adress
import 'Crop.dart';
import '../../services/evp_api_service.dart';
import './Evapotranspiration.dart';

class Garden {
  final String name;
  late List<Crop> crops=[]   ;
  String imgUrl ="https://source.unsplash.com/random/300%C3%97300/?garden" ;
  final double latitude;
  final double longitude;
  String description ;

// Getter for imgUrl
  String get imageUrl => imgUrl;

  // Method to add a new crop to the zone
  void addCrop(Crop newCrop) {
    crops.add(newCrop);
  }

  // Method to remove a crop by its name
  void removeCrop(String cropName) {
    crops.removeWhere((crop) => crop.name == cropName);
  }

  // Method to update an existing crop by its name
  void updateCrop(String oldCropName, Crop updatedCrop) {
    int index = crops.indexWhere((crop) => crop.name == oldCropName);
    if (index != -1) {
      crops[index] = updatedCrop;
    } else {
      print("Error: Crop not found in zone.");
    }
  }
  // Setter for description
  set imageUrl(String newUrl) {
    imgUrl = newUrl;
  }
  Garden({required this.name, required this.latitude, required this.longitude , required this.description, required this.crops});
// Méthode pour mettre à jour la valeur actuelle d'EVP
// Getter pour l'évapotranspiration => garden.evapotranspiration
  Future<double?> get evapotranspiration async {
    try {
      // Appeler la fonction fetchEvp pour obtenir la valeur actuelle d'EVP
      Future<Evapotranspiration> futureEvp;
      futureEvp = fetchEvp(latitude, longitude);
      final evpData = await futureEvp;
      return evpData.evapotranspiration_mm;
    } catch (e) {
      // Gérer les erreurs de récupération de l'EVP (ex : réseau indisponible)
      print('Error getting evapotranspiration: $e');
      return 0;
    }
  }
}
