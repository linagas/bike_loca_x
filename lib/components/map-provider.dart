import 'package:bike_loca_x/components/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapProvider extends StatefulWidget {
  @override
  _MapProviderState createState() => _MapProviderState();
}

class _MapProviderState extends State<MapProvider> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(-33.4539101, -70.6335762);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    print(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mapa BikeLoca'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
        drawer: MyDrawer(),
      ),
    );
  }
}
