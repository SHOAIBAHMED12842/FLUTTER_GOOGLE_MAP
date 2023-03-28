import 'package:flutter/material.dart';
//import 'package:flutter_geocoder/geocoder.dart';
//import 'package:flutter_geocoder/geocoder.dart';
import 'package:geocoding/geocoding.dart';

class ConvertLatLangToAddress extends StatefulWidget {
  const ConvertLatLangToAddress({Key? key}) : super(key: key);

  @override
  _ConvertLatLangToAddressState createState() =>
      _ConvertLatLangToAddressState();
}

class _ConvertLatLangToAddressState extends State<ConvertLatLangToAddress> {
  TextEditingController _latcontroller = TextEditingController();
  TextEditingController _lngcontroller = TextEditingController();
  double? latitude, longitude;
  bool islat =false;
  bool islng=false;
  String islatitude='Wrong Latitude';
  String islongitude='Wrong Longitude';
  String stAddress1 = '', stAddress2 = '', stadd = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _latcontroller.addListener(() { 
      
      setState(() {
        latitude=double.tryParse(_latcontroller.text) ?? 0;
        islat=true;
      });
    });
     _lngcontroller.addListener(() { 
      setState(() {
        longitude=double.tryParse(_lngcontroller.text) ?? 0;
        islng=true;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Center(
          child: Text('Latitude Longitude Address'),
        ),
      ),
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         TextFormField(
              controller: _latcontroller,
              decoration: const InputDecoration(hintText: 'Enter Latitude'),
            ),
             TextFormField(
              controller: _lngcontroller,
              decoration: const InputDecoration(hintText: 'Enter Longitude'),
            ),
            const SizedBox(height: 10,),
        !islat ? const Text(''):Text('Latitude: $latitude'),
        !islng? const Text(""):Text("Longitude: $longitude"),
        const SizedBox(height: 10,),
        Text(stadd),
        GestureDetector(
          onTap: () async {
            List<Location> locations =
                await locationFromAddress("Gronausestraat 710, Enschede");
            List<Placemark> placemarks =
                await placemarkFromCoordinates(latitude!,longitude!);
//From a query
            // final query = "1600 Amphiteatre Parkway, Mountain View";
            // var addresses = await Geocoder.local.findAddressesFromQuery(query);
            // var first1 = addresses.first;
            // print(
            //   "${first1.featureName} : ${first1.coordinates}",  //to coordinates
            // );
            // final coordinates = Coordinates(33.6992, 72.9744);
            // var address =
            //     await Geocoder.local.findAddressesFromCoordinates(coordinates);
            // var first = address.first;
            // //Text("Address"+ first.featureName.toString()+first.addressLine.toString());
            // print("Address" +
            //     first.featureName.toString() +
            //     first.addressLine.toString()); //print address
            setState(() {
              //stAddress=first.addressLine.toString();
              //stadd=placemarks.reversed.last.country.toString() + placemarks.reversed.last.locality.toString();
               final add = placemarks.first;
                        stadd = "${add.street} ${add.name} ${add.postalCode} ${add.thoroughfare} ${add.subLocality} ${add.locality} ${add.administrativeArea} ${add.country}";
              // stadd =
              //     "${placemarks.first.administrativeArea} ,${placemarks.first.country} ,${placemarks.first.isoCountryCode} ,${placemarks.first.locality} ,${placemarks.first.name} ,${placemarks.first.postalCode} ,${placemarks.first.street} ,${placemarks.first.subAdministrativeArea} ,${placemarks.first.subLocality} ,${placemarks.first.subThoroughfare} ,${placemarks.first.thoroughfare}";
              // stadd = placemarks.first.administrativeArea.toString() +
              //     placemarks.first.country.toString() +
              //     placemarks.first.isoCountryCode.toString() +
              //     placemarks.first.locality.toString() +
              //     placemarks.first.name.toString() +
              //     placemarks.first.postalCode.toString() +
              //     placemarks.first.street.toString() +
              //     placemarks.first.subAdministrativeArea.toString() +
              //     placemarks.first.subLocality.toString() +
              //     placemarks.first.subThoroughfare.toString() +
              //     placemarks.first.thoroughfare.toString();
              stAddress1 = "${locations.last.latitude}";
              stAddress2 = "${locations.last.longitude}";
            });
            print(placemarks.reversed.last.country.toString() +
                placemarks.reversed.last.locality.toString());
          },
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
              child: const Center(
                child: Text('Convert'),
              ),
            ),
          ),
        ),
      ],
    )
        // Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       Column(
        //         children: <Widget>[
        //            Text('latitude: 37.597576, longitude: 55.771899'),
        //        //   Text(address),
        //         ],
        //       ),
        //       const SizedBox(height: 40),
        //       Column(
        //         children: <Widget>[
        //           const Text('address: Москва, 4-я Тверская-Ямская улица, 7'),
        //           //Text(latLong),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () async {

        //     // From coordinates
        //     final coordinates = new Coordinates(33.6992, 72.9744);
        //     final addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
        //     final first = addresses.first;
        //     print("${first.featureName} : ${first.addressLine}");

        //     // From a query
        //     final query = "1600 Amphiteatre Parkway, Mountain View";
        //     var add = await Geocoder.local.findAddressesFromQuery(query);
        //     var second = add.first;
        //     print("${second.featureName} : ${second.coordinates}");
        //     // setState(() {});
        //   },
        //   child: const Icon(Icons.search),
        // ),
        );
  }
}
