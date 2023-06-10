import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
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
  TextEditingController _searchDestinationController = TextEditingController();

  Set<Marker> _markers = Set<Marker>();
  Set<Polyline> _polylines = Set<Polyline>();
  static Polyline _polyline = const Polyline(
      polylineId: PolylineId('polylineId'),
      width: 2,
      color: Colors.blue,
  );

  int _polylineCounter = 1;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(40.453053, -3.688344),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
    _setLocation(LatLng(40.453053, -3.688344));
  }

  void _setLocation(LatLng point) {
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId('marker'),
            position: point,
        )
      );
    });
  }
  
  void _setPolyline(List<PointLatLng> points) {
    setState(() {
      final String polylineId = 'polyline_$_polylineCounter';
      _polylineCounter++;
      _polyline =
      // _polylines.add(
        Polyline(
            polylineId: PolylineId(polylineId),
            width: 2,
            color: Colors.blue,
            points: points.
              map(
                (point) => LatLng(point.latitude, point.longitude),
            )
            .toList(),
        // )
      );
    });
  }

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
              Expanded(
                  child:
                  Column(
                    children: [
                      TextFormField(
                        controller: _searchOriginController,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(hintText: ' Origin'),
                        onChanged: (value) {},

                      ),
                      TextFormField(
                        controller: _searchDestinationController,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(hintText: ' Destination'),
                        onChanged: (value) {},
                      ),
                    ],
                  ),
              ),
              IconButton(
                onPressed: () async {
                  var directions = await Location().getDirection(_searchOriginController.text, _searchDestinationController.text);
                  _changeCameraPosition(directions['start_location']['lat'], directions['start_location']['lng'], directions['northeast'], directions['southwest']);
                  _setPolyline(directions['polyline_decoded']);
                },
                icon: Icon(Icons.search))
            ],
          ),
          Expanded(
              child: GoogleMap(
                mapType: MapType.normal,
                markers: _markers,
                // polylines: _polylines,
                polylines: {
                  _polyline,
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

  Future<void> _changeCameraPosition(double lat, double lng, Map<String, dynamic> northeast, Map<String, dynamic> southwest) async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 12),
      ),
    );
    controller.animateCamera(
        CameraUpdate.newLatLngBounds(
          LatLngBounds(
              southwest: LatLng(southwest['lat'], southwest['lng']),
              northeast: LatLng(northeast['lat'], northeast['lng']),
          ),
          25,
        )
    );
    _setLocation(LatLng(lat, lng));
  }
}

