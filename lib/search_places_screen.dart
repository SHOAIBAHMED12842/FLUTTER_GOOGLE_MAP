import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class SearchPlacesScreen extends StatefulWidget {
  const SearchPlacesScreen({super.key});

  @override
  State<SearchPlacesScreen> createState() => _SearchPlacesScreenState();
}

class _SearchPlacesScreenState extends State<SearchPlacesScreen> {
  TextEditingController _controller = TextEditingController();
  var uuid = Uuid();
  String _sessiontoken = '123456';
  List<dynamic> _placeslist=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      onChange();
    });
  }

  void onChange() {
    if (_sessiontoken == null) {
      setState(() {
        _sessiontoken = uuid.v4();
      });
    }
    getSuggestion(_controller.text);
  }

  void getSuggestion(String input) async {
    String kGoogleApiKey = 'AIzaSyCM2ubwc7nWDm9DfBhYFiMhQ5Qcg2pFCWU';
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$input&key=$kGoogleApiKey&sessiontoken=$_sessiontoken';
    var response = await http.get(Uri.parse(request));
    var data =response.body.toString();
    print('Data');
    print(data);
    if (response.statusCode == 200) {
      setState(() {
        _placeslist =jsonDecode(response.body.toString()) ['predictions'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: homeScaffoldKey,
      appBar: AppBar(
        title: const Center(child: Text("Google Search Places")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _controller,
              decoration: const InputDecoration(hintText: 'Search places with name'),
            ),
            Expanded(child: ListView.builder(
              itemCount: _placeslist.length,
              itemBuilder: ((context, index) {
              return ListTile(
                onTap: () async{
                  List<Location> locations =
                await locationFromAddress(_placeslist[index]['description']);
                print(locations.last.latitude);
                print(locations.last.longitude);
                },
                title: Text(_placeslist[index]['description']),
              );
            }
            ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
