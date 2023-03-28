import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleHomeScreen extends StatefulWidget {
  const GoogleHomeScreen({super.key});

  @override
  State<GoogleHomeScreen> createState() => _GoogleHomeScreenState();
}

class _GoogleHomeScreenState extends State<GoogleHomeScreen> {
  final Completer<GoogleMapController> _controller =
      Completer(); //access features in fururre
  static const LatLng showLocation = LatLng(24.9180271, 67.0970916);//25.9,68.097

  final List<Marker> _markers = //<Marker>
  []; 
  final List<Marker> _list = const [
    Marker(
      markerId: MarkerId('SomeId'),
      
      position: LatLng(24.8478544,67.0036902),
      infoWindow: InfoWindow(
          title: 'AF FERGUSON'
      )
    ),
    Marker(  //second marker
        markerId: MarkerId('SomeId2'),
        position: LatLng(24.9180271, 67.0970916),
        infoWindow: InfoWindow(
            title: 'HOME'
        )
    ),
  ];
   static const CameraPosition _campostion = CameraPosition(
    target: showLocation,//LatLng(24.9180271, 67.0970916),
    zoom: 14,
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _markers.addAll(_list);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        title: const Center(
          child: Text('Simple Google Map'),
        ),
      ),
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _campostion,
          mapType: MapType.normal,
          compassEnabled: true,
          myLocationButtonEnabled: true,
          markers: Set<Marker>.of(_markers),
          onMapCreated: (GoogleMapController controller){  //enable CameraUpdate position to use it
              _controller.complete(controller);
            },
          ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.location_city),
          onPressed: () async {
            GoogleMapController controller = await _controller.future;
            controller.animateCamera(
              CameraUpdate.newCameraPosition(
                 const CameraPosition(
                  target: LatLng(24.8478544,67.0036902),
                  zoom: 14,
                ),
              ),
            );
            setState(() {
              
            });
          },
          ),   
    );
  }
}