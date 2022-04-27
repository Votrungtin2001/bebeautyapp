import 'dart:async';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter/services.dart' show rootBundle;

class GoogleMapSearch extends StatefulWidget {
  @override
  _GoogleMapSearch createState() => _GoogleMapSearch();
}

class _GoogleMapSearch extends State<GoogleMapSearch> {
  String googleApikey = "AIzaSyAp41ZgveBzyy8Pa1Zeb2HcWWjqtKezi24";
  Completer<GoogleMapController> _mapController = Completer();


  Set<Marker> _markers = {};




  final CameraPosition _initialCamera = CameraPosition(
    target: LatLng(-20.3000, -40.2990),
    zoom: 14.0000,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Map widget
          GoogleMap(
            initialCameraPosition: _initialCamera,
            markers: _markers,

            // Adds Path from user to selected location
            polylines: Set()
              ..add(
                Polyline(
                  polylineId: PolylineId('path'),
                  endCap: Cap.roundCap,
                  geodesic: true,
                  jointType: JointType.round,
                  startCap: Cap.squareCap,
                  width: 5,
                ),
              ),
            onMapCreated: (GoogleMapController controller) async {
              _mapController.complete(controller);

              // Changes the Map Style


              // Creates Marker on current user location, using a current icon.
              final userLocation = Marker(
                markerId: MarkerId('user-location'),
                icon: await BitmapDescriptor.fromAssetImage(
                  ImageConfiguration(
                    devicePixelRatio: 2.5,
                  ),
                  'assets/user_location.png',
                ),
                position: _initialCamera.target,
              );
              setState(() => _markers.add(userLocation));
            },
          ),
        ],
      ),
    );
  }
}