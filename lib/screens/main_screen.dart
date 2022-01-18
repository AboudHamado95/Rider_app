import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rider_app/widgets/divider.dart';
import 'package:rider_app/widgets/drawer.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Completer<GoogleMapController> _controllerGoogleMap = Completer();
    GoogleMapController newGoogleMapController;
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    CameraPosition _kGooglePlex = const CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,
    );
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Rider App'),
      ),
      drawer: const DrawerWidget(),
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
          Positioned(
            top: 45.0,
            left: 25.0,
            child: GestureDetector(
              onTap: () => scaffoldKey.currentState!.openDrawer(),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 6.0,
                      spreadRadius: 0.5,
                      offset: Offset(0.7, 0.7),
                    )
                  ],
                ),
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  radius: 20.0,
                ),
              ),
            ),
          ),
          Positioned(
            right: 0.0,
            left: 0.0,
            bottom: 0.0,
            child: Container(
              height: 320,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.0),
                  topRight: Radius.circular(32.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 16.0,
                    spreadRadius: 0.5,
                    offset: Offset(0.7, 0.7),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 6.0,
                    ),
                    const Text(
                      'Hi there',
                      style: TextStyle(fontSize: 12.0),
                    ),
                    const SizedBox(height: 12.0),
                    const Text(
                      'Where to?',
                      style:
                          TextStyle(fontSize: 20.0, fontFamily: 'Brand Bold'),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 6.0,
                            spreadRadius: 0.5,
                            offset: Offset(0.7, 0.7),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.search,
                              color: Colors.blueAccent,
                            ),
                            SizedBox(width: 10.0),
                            Text('Search Drop Off')
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    Row(
                      children: [
                        const Icon(
                          Icons.home,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Add Home'),
                            SizedBox(width: 4.0),
                            Text(
                              'Your Living Home Address',
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    const DividerWidget(),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        const Icon(
                          Icons.work,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Add Work'),
                            SizedBox(width: 4.0),
                            Text(
                              'Your Office Address',
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
