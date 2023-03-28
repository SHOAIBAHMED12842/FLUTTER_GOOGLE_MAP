import 'package:flutter/material.dart';
import 'package:flutter_google_maps/custom_marker_with_network_image.dart';
import 'package:flutter_google_maps/google_map_styling_screen.dart';
import 'package:flutter_google_maps/polygone_screen.dart';
import 'package:flutter_google_maps/polyline_screen.dart';
import 'package:flutter_google_maps/polyline_two.dart';
import 'package:flutter_google_maps/simple_google_map_screen.dart';
import 'package:flutter_google_maps/convert_latlang_to_address.dart';
import 'package:flutter_google_maps/current_location.dart';
import 'package:flutter_google_maps/custom_marker_info_window.dart';
import 'package:flutter_google_maps/search_places_screen.dart';

import 'custom_marker_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Google Map'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8,),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const GoogleHomeScreen()));
              },
              child: CustomTextButton('Simple Google Map')
            ),
            const SizedBox(height: 8,),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ConvertLatLangToAddress()));
              },
              child: CustomTextButton('Latitude Longitude Address')
            ),
            const SizedBox(height: 8,),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CurrentLocationScreen()));
              },
              child: CustomTextButton('Current Google Map Location')
            ),
            const SizedBox(height: 8,),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchPlacesScreen()));
              },
              child: CustomTextButton('Google Search Places'),
            ),
             const SizedBox(height: 8,),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CustomMarkerScreen()));
              },
              child: CustomTextButton('Google Map Custom Marker'),
            ),
            const SizedBox(height: 8,),
             InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CustomMarkerInfoWindowScreen()));
              },
              child: CustomTextButton('Map Custom Info Window'),
            ),
            const SizedBox(height: 8,),
             InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CustomMarkerWithNetworkImage()));
              },
              child: CustomTextButton('Marker with Network Image'),
            ),
             const SizedBox(height: 8,),
             InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PolygoneScreen()));
              },
              child: CustomTextButton('Google Map Polygone'),
            ),
             const SizedBox(height: 8,),
             InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PolylineTwoScreen()));
              },
              child: CustomTextButton('Polyline Two Points'),
            ),
             const SizedBox(height: 8,),
             InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PolylineScreen()));
              },
              child: CustomTextButton('Google Map Polyline'),
            ),
             const SizedBox(height: 8,),
             InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const GoolgeMapStyling()));
              },
              child: CustomTextButton('Google Map Styling'),
            ),
            const SizedBox(height: 8,),
          ],
        ),
      ),
    );
  }
}
Widget CustomTextButton(String title) {
   
      return  Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                      child: Text(
                    title,
                    style: const TextStyle(color: Colors.white,fontSize: 22),
                  )),
                ),
              );
            
  }

