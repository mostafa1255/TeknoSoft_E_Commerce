import 'package:geolocator/geolocator.dart';
import '../tools/Location_Services.dart';

Future<String> determineCurrentLocation() async {
  Position position = await LocationServices.determinePosition();
  return LocationServices.getCurrentPositionStreet(
      latitude: position.latitude, longitude: position.longitude);
  ;
}
