import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class MapBuildingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: MapSampleaaaa(),
    );
  }
}
class MapSampleaaaa extends StatefulWidget {
  @override
  State<MapSampleaaaa> createState() => MapSampleaaaaState();
}

class MapSampleaaaaState extends State<MapSampleaaaa> {
  late GoogleMapController _controller;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(23.7413895, 90.3649823),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = const CameraPosition(

      target: LatLng(23.74705, 90.3791474),

      zoom: 17);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {

    _controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
