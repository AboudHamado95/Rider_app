import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rider_app/widgets/show_dialog.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Completer<GoogleMapController> _controllerGoogleMap = Completer();
    GoogleMapController newGoogleMapController;

    CameraPosition _kGooglePlex = const CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,
    );
    return Scaffold(
        appBar: AppBar(
          title: const Text('Rider App'),
        ),
        body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: _kGooglePlex,
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                _controllerGoogleMap.complete(controller);
                newGoogleMapController = controller;
              },
            ),
          ],
        ));
  }
}
