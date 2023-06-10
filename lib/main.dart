import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled4/location.dart';
import 'config.dart';


Future<void> main() async {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EMaps',
      home: MapRouteInit(),
    );
  }
}

class MapRouteInit extends StatefulWidget {
  @override
  State<MapRouteInit> createState() => MapRoute();
}

class MapRoute extends State<MapRouteInit> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  TextEditingController _searchOriginController = TextEditingController();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(40.453053, -3.688344),
    zoom: 14.4746,
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EMaps'),
      ),
      body: Column (
        children: [
          Row(
            children: [
              Expanded(child: TextFormField(
                controller: _searchOriginController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(hintText: 'Origin'),
                onChanged: (value) {},
              )),
              IconButton(
                  onPressed: () async {
                    var place = await Location().getLocation(_searchOriginController.text);
                    _changeCameraPostion(place);
                  },
                  icon: Icon(Icons.search))
            ],
          ),
          Expanded(
              child: GoogleMap(
                mapType: MapType.normal,
                markers: {
                },
                polylines: {
                },
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
          )
        ],
      )
    );
  }

  Future<void> _changeCameraPostion(Map<String, dynamic> place) async {
    final double lat = place['geometry']['location']['lat'];
    final double lng = place['geometry']['location']['lng'];

    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 20),
      ),
    );
  }
}

