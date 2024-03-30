import 'dart:async';

import 'package:education/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Location location = Location();
  double lat = 0;
  double long = 0;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  void initState() {
    initial();
    setState(() {});
    super.initState();
  }

  void initial() async {
    final prem = await LocationService().handlePermission();
    if (prem == 'granted') {
      final currentLocation = await location.getLocation();
      setState(() {
        lat = currentLocation.latitude!;
        long = currentLocation.longitude!;
      });
    } else {
      'false';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        markers: {
          lat == 0
              ? const Marker(markerId: MarkerId(''))
              : Marker(
                  markerId: const MarkerId('1'),
                  position: LatLng(lat, long),
                )
        },
        initialCameraPosition: CameraPosition(
          target: lat == 0
              ? const LatLng(-6.821529, 107.567824)
              : LatLng(lat, long),
          zoom: lat == 0 ? 5 : 10,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 6, bottom: 120),
          child: FloatingActionButton(
            mini: true,
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              return controller
                  .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                target: LatLng(lat, long),
                zoom: 16,
              )));
            },
            child: const Icon(Icons.my_location, size: 24),
          ),
        ),
      ),
    );
  }
}
