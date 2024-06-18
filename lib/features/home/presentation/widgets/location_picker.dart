import 'package:flutter/material.dart';
import 'package:food_hub/core/utils/get_location.dart';
import 'package:location/location.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class MapboxPlacePicker extends StatefulWidget {
  const MapboxPlacePicker({super.key});

  @override
  MapboxPlacePickerState createState() => MapboxPlacePickerState();
}

class MapboxPlacePickerState extends State<MapboxPlacePicker> {
  MapboxMap? mapController;
  Position? selectedLocation;
  Position? currentLocation;
  String? placeName;

  void _onMapCreated(MapboxMap controller) async {
    mapController = controller;
    LocationData? location = await getLocation();
    if (location != null) {
      setState(() {
        debugPrint("Location is ${location.latitude}   ${location.longitude}");
        currentLocation = Position(location.longitude!, location.latitude!);
        mapController?.flyTo(
            CameraOptions(center: Point(coordinates: currentLocation!)),
            MapAnimationOptions(
              duration: 500,
            ));
      });
    }
  }

  void _onMapTapped(Point point, Position coordinates) async {
    setState(() {
      selectedLocation = coordinates;
    });

    // Optionally, you can get the place name using reverse geocoding APIs (Mapbox, Google Maps, etc.)
    // For demonstration, we'll just set a placeholder name
    setState(() {
      placeName = "Selected Place: (${coordinates.lat}, ${coordinates.lng})";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MapWidget(
            onMapCreated: _onMapCreated,
            cameraOptions: CameraOptions(
              center: Point(
                  coordinates: currentLocation ?? Position(37.7749, -122.4194)),
              zoom: 2.0,
            ),
            onTapListener: (value) {
              _onMapTapped(value.point,
                  Position(value.touchPosition.x, value.touchPosition.y));
            },
          ),
          if (selectedLocation != null)
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    placeName ?? "No place selected",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
