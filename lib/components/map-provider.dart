import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocation/geolocation.dart';
// Own
import 'package:bike_loca_x/components/drawer.dart';
import '../service_locator.dart';
import '../services/storage_service.dart';

class MapProvider extends StatefulWidget {
  @override
  _MapProviderState createState() => _MapProviderState();
}

class _MapProviderState extends State<MapProvider> {
  final StorageService _storageService = locator<StorageService>();
  GoogleMapController mapController;
  LatLng _currentPosition;
  BitmapDescriptor pinLocationIcon;
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    checkGps().then((latLng) => {
          setState(() {
            _currentPosition = latLng;
          }),
          addMarker(),
        });
    getRecords();
  }

  @override
  Widget build(BuildContext context) {
    print(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('BikeLoca'),
          backgroundColor: Colors.cyan[300],
        ),
        body: _currentPosition == null
          ? Container()
            : GoogleMap(
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              onCameraMove: _onCameraMove,
              onMapCreated: _onMapCreated,
              markers: _markers,
              initialCameraPosition: CameraPosition(
                target: _currentPosition,
                zoom: 16.0,
              ),
        ),
        drawer: MyDrawer(),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // Add your onPressed code here!
          },
          label: Text(''),
          icon: Icon(Icons.plus_one),
          backgroundColor: Colors.pink,
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

  checkGps() async {
    LocationResult result = await Geolocation.lastKnownLocation();
    if (result.isSuccessful) {
      return LatLng(result.location.latitude, result.location.longitude);
    }
  }

  /*
   * Get records from _storageService
   */
  void getRecords() async {
    final bikeParkIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(106, 106)),
        'assets/images/bike-park.jpeg');
    var latLng;
    Marker resultMarker;

    var records = await _storageService.getRecords();
    var id = 1;
    records.forEach((e) => {
          print(e),
          latLng = LatLng(e['lat'].toDouble(), e['lon'].toDouble()),
          resultMarker = Marker(
            markerId: MarkerId(id.toString()),
            position: latLng,
            icon: bikeParkIcon,
          ),
          setState(() {
            _markers.add(resultMarker);
          }),
          id++
        });
  }

  void addMarker() async {
    final pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(106, 106)),
        'assets/images/bike-icon.png');
    Marker resultMarker = Marker(
      markerId: MarkerId("<user-id>"),
      position: _currentPosition,
      icon: pinLocationIcon,
    );
    setState(() {
      _markers.add(resultMarker);
    });
  }
}
