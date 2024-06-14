import 'package:location/location.dart';

Future<LocationData?> getLocation() async {
  final Location location = Location();

  bool serviceEnabled = false;

  late PermissionStatus permissionGranted;

  LocationData? locationData;
  await location.enableBackgroundMode(enable: true);
  serviceEnabled = await location.serviceEnabled();
  if (serviceEnabled) locationData;
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (serviceEnabled) {
      return locationData;
    }
  }
  permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      return locationData;
    }
  }

  locationData = await location.getLocation();

  return locationData;
}
