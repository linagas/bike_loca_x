import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapProvider extends StatefulWidget {
  LatLng _current = const LatLng(45.521563, -122.677433);

  @override
  _MapProviderState createState() => _MapProviderState(_current);

  Future<void> _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      return LatLng(position.latitude, position.longitude);
    }).catchError((e) {
      print(e);
    });
  }
}

class _MapProviderState extends State<MapProvider> {
  GoogleMapController mapController;
  LatLng _currentPosition;

  _MapProviderState(LatLng _currentPosition) {
    this._currentPosition = _currentPosition;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mapa BikeLoca'),
          backgroundColor: Colors.cyan[300],
        ),
        body: GoogleMap(
          onCameraMove: _onCameraMove,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _currentPosition,
            zoom: 16.0,
          ),
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _onCameraMove(CameraPosition position) {
    _currentPosition = position.target;
  }
}
