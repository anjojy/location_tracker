import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_tracker/Constants/StaticText.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> locationMarkers = [];
  double _currentLat = 10.8505;
  double _currentLong = 76.2711;
  static final CameraPosition _keralaLatLong = CameraPosition(
    target: LatLng(10.8505, 76.2711),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        markers: Set.from(locationMarkers),
        initialCameraPosition: _keralaLatLong,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _getLocation,
        label: Text(StaticText.getLocationBtnText),
        icon: Icon(Icons.add_location),
      ),
    );
  }

  Future<void> _getLocation() async {
    final GoogleMapController controller = await _controller.future;
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    _currentLat = position.latitude;
    _currentLong = position.longitude;
    setState(() {
      locationMarkers.add(Marker(
          markerId: MarkerId('01'),
          draggable: true,
          onTap: () {
            print('Marker Tapped');
          },
          position: LatLng(_currentLat, _currentLong)));
    });
    CameraPosition _currenLocation = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(_currentLat, _currentLong),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);
    controller.animateCamera(CameraUpdate.newCameraPosition(_currenLocation));
  }
}
