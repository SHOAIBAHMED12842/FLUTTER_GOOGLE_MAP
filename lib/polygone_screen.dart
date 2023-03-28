import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class PolygoneScreen extends StatefulWidget {
  const PolygoneScreen({Key? key}) : super(key: key);

  @override
  _PolygoneScreenState createState() => _PolygoneScreenState();
}

class _PolygoneScreenState extends State<PolygoneScreen> {

  final Completer<GoogleMapController> _controller = Completer();


  final CameraPosition _kGooglePlex =  const CameraPosition(
    target: LatLng(24.96763861471985, 67.51917559729354),
    zoom: 8.0,
  );
  final Set<Marker> _markers = {};
  final Set<Polygon> _polygone = HashSet<Polygon>() ;

  List<LatLng> points = [
    const LatLng(25.149888667248597, 67.62491900490775),
    const LatLng(25.318212522964238, 67.44776446487873),

    const LatLng(25.628159170679307, 67.36811358641607),
    const LatLng(25.519149089039868, 67.21979815755455),
    const LatLng(25.261095505205244, 67.13190753304403),
    const LatLng(25.106994123750052, 67.02479083442182),
    const LatLng(25.042313041721123, 66.95337970200701),
    const LatLng(24.96016867647767, 66.77485187097001),
    const LatLng(24.83809558483305, 66.65949542629993),
    const LatLng(24.845572915106324, 66.80781085516146),
    const LatLng(24.828125108496046, 66.92591388184748),
    const LatLng(24.778260689577717, 67.04127032651753),
    const LatLng(24.8181538293602, 67.24177081368218),
    const LatLng(24.78324803377205, 67.47797686705422),

    const LatLng(24.96763861471985, 67.51917559729354),
    const LatLng(25.149888667248597, 67.62491900490775),

  ] ;


  void _setPolygone(){
    _polygone.add(
        Polygon(polygonId: const PolygonId('1') ,
            points: points ,
            strokeColor: Colors.deepOrange,
            strokeWidth: 5 ,
            fillColor: Colors.deepOrange.withOpacity(0.1),
            geodesic: true
        )
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setPolygone() ;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Google Map Polygone')),),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        myLocationButtonEnabled: true,
        myLocationEnabled: false,
        // cameraTargetBounds: CameraTargetBounds(const LatLngBounds(
        //   northeast: const LatLng(9.006808, -79.508148),
        //   southwest:  const LatLng(9.003121, -79.505702),
        // )),
        //  onCameraMove: ((_position) => _updatePosition(_position)),
        markers:_markers ,
        polygons: _polygone,

        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
