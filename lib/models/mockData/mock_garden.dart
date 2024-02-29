// ignore_for_file: non_constant_identifier_names

 
import "package:lettucelink/models/Business/Garden.dart";
 
import "package:lettucelink/models/Business/Crop.dart";
 




final mockCrop1 = Crop(name : "Tomato", hydricState: 0) ;
final mockCrop2 = Crop(name : "Carrot", hydricState: 2) ;

final mockCrop3 = Crop(name : "Spinach", hydricState: 1) ;
final mockCrop4 = Crop(name : "Artichoke", hydricState: 0) ;
final mockCrop5 = Crop(name : "Lettuce", hydricState: 0) ;
List<Crop> lmockCrop1 = [ mockCrop1 , mockCrop2] ;
List<Crop> lmockCrop2 = [ mockCrop3 , mockCrop4,mockCrop5] ;
 

final mockGardenHome = Garden(name: "jardin maison2", latitude: 1.6, longitude: 1.3, description: "my little garden2" , crops: lmockCrop2) ;

final mockGardenHome2 = Garden(name: "jardin maison", latitude: 1.6, longitude: 1.3, description: "my little garden" , crops: lmockCrop1) ;

/*
print('garden name is ${mockGarden.name} , located at lat: ${mockGarden.latitude} , lon: ${mockGarden.longitude}');
Future <Evapotranspiration> future_evp  ;
future_evp  = fetchEvp(mockGarden.latitude, mockGarden.longitude);
final evpData = await future_evp;

print ("current evp is ${evpData.evapotranspiration_mm} mm") ;
for (final zone in mockGarden.zones) {
    print('Zone: ${zone.name}, Crop: ${zone.crop?.name ?? 'None'}');
  }
}
*/

