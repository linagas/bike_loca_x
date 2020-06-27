import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

//import './drawer.dart';

class HomePage extends StatefulWidget {
  @override
    _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /* Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(-33.449272, -70.660960);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  } */

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bike Lovers Sites'),
          backgroundColor: Colors.black,
        ),
        /* body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
        drawer: MyDrawer(), */
      ),
    );
  }
}

