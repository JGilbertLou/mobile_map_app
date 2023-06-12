import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'dart:async';
import 'dart:io';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled4/location.dart';
import 'config.dart';
import 'dart:math'  as Math;


// Future<void> main() async {
//   runApp(MyApp());
// }
//
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'EMaps',
//       home: MapRouteInit(carAutonomy: 200,),
//     );
//   }
// }

class MapRouteInit extends StatefulWidget {
  double carAutonomy;
  String? origin;
  String? destination;
  String? tripUIID;

  MapRouteInit({
    required this.carAutonomy,
    this.origin,
    this.destination,
    this.tripUIID
  });

  @override
  _MapRoute createState() => _MapRoute(carAutonomy, origin, destination, tripUIID);
}

class _MapRoute extends State<MapRouteInit> {
  bool isMinus = false;
  double carAutonomy;
  String? origin;
  String? destination;
  String? tripUIID;

  _MapRoute(
      this.carAutonomy,
      this.origin,
      this.destination,
      this.tripUIID
  );

  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  TextEditingController? _searchOriginController;
  TextEditingController? _searchDestinationController;

  Set<Marker> _markers = Set<Marker>();
  static Polyline _polyline = const Polyline(
    polylineId: PolylineId('polylineId'),
    width: 2,
    color: Colors.blue,
  );

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(40.453053, -3.688344),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
    if (tripUIID == null) {
      _searchOriginController = TextEditingController();
      _searchDestinationController = TextEditingController();
      _setLocation(LatLng(40.453053, -3.688344));
    } else {
      isMinus = true;
      _handleDirections(widget.origin!, widget.destination!);
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(132.0),
            child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
            child: AppBar(
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF0C747E),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0), // Add top padding here
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 45.0),
                          child:
                            Container (
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0),
                                color: Colors.white,
                              ),
                              child: TextFormField (
                                controller: _searchOriginController,
                                textCapitalization: TextCapitalization.words,
                                enabled: origin == null,
                                initialValue: origin,
                                decoration: const InputDecoration (
                                  hintText: 'Enter origin',
                                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                                  border: InputBorder.none,
                                ),
                                readOnly: origin != null,
                              ),
                            ),
                        ),
                        const SizedBox(height: 12.0),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40.0),
                                  color: Colors.white,
                                ),
                                child: TextFormField(
                                  controller: _searchDestinationController,
                                  textCapitalization: TextCapitalization.words,
                                  enabled: destination == null,
                                  initialValue: destination,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter destination',
                                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                                    border: InputBorder.none,
                                  ),
                                  readOnly: destination != null,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            // ClipOval(
                            //   child: Container(
                            //     width: 46, // Set the desired button width
                            //     height: 46, // Set the desired button height
                            //     color: Color(0xFFFF722D), // Set the desired button color
                            //     child:
                            IconButton(
                              icon: const Icon(
                                Icons.search,
                                size: 30,
                                color: Colors.white,
                              ),
                              onPressed: () async {
                                if (_searchOriginController?.text != null && _searchDestinationController?.text != null) {
                                  var directions = await Location().getDirection(_searchOriginController?.text, _searchDestinationController?.text);
                                  _changeCameraPosition(directions['start_location']['lat'], directions['start_location']['lng'], directions['northeast'], directions['southwest']);
                                  _setPolyline(directions['polyline_decoded']);
                                }
                              },
                            ),
                            //   ),
                            // ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (isMinus) {
                // Button is currently in minus state
                tripUIID = null;
              } else {

                FirebaseAuth auth = FirebaseAuth.instance;
                User? user = auth.currentUser;

                if (user != null) {
                  String uid = user.uid;
                  print('User UUID: $uid');
                } else {
                  print('User is not authenticated.');
                }




                // Button is currently in plus state
                tripUIID = 'hola'; // Replace with your logic
              }
              isMinus = !isMinus; // Toggle the state
            });
          },
          child: Icon(
            isMinus ? Icons.remove : Icons.add, // Use the correct icons
          ),
          backgroundColor: Color(0xFFFF722D),
        ),
        body: Column (
          children: [
            Expanded(
              child: GoogleMap(
                mapType: MapType.normal,
                markers: _markers,
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

  double _calculateDistance(LatLng subRouteOrigin, LatLng subRouteDestination) {
    final int radiusOfEarth = 6371;

    final double latOrigin = subRouteOrigin.latitude * (3.14159265359 / 180);
    final double lonOrigin = subRouteOrigin.longitude * (3.14159265359 / 180);

    final double latDestination = subRouteDestination.latitude * (3.14159265359 / 180);
    final double lonDestination = subRouteDestination.longitude * (3.14159265359 / 180);

    final double latDiff = latDestination - latOrigin;
    final double lonDiff = lonDestination - lonOrigin;

    final double a = (Math.sin(latDiff / 2) * Math.sin(latDiff / 2)) +
        (Math.cos(latOrigin) * Math.cos(latDestination) * Math.sin(lonDiff / 2) * Math.sin(lonDiff / 2));
    final double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));

    final double distance = radiusOfEarth * c;

    return distance;
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

  void _setPolyline(List<PointLatLng> points) async {
    List<LatLng> polylineLatLng = points
        .map((point) => LatLng(point.latitude, point.longitude))
        .toList();
    double needGas = 0.0;

    List<LatLng> markerPositions = [];
    markerPositions.add(polylineLatLng.first);

    for (int i = 1; i < polylineLatLng.length; i++) {
      LatLng currentLocation = polylineLatLng[i];
      LatLng previousLocation = polylineLatLng[i - 1];
      double segmentDistance = _calculateDistance(previousLocation, currentLocation);
      needGas += segmentDistance;

      if (needGas >= carAutonomy) {
        LatLng nearestEStation = await Location().findNearestEStation(previousLocation, currentLocation);
        if (nearestEStation != currentLocation) {
          markerPositions.add(nearestEStation);
          needGas = 0.0;
        }
      }
    }
    setState(() {
      _polyline = Polyline(
        polylineId: PolylineId("polylineId"),
        width: 2,
        color: Colors.blue,
        points: polylineLatLng,
      );

      _markers.clear();
      for (LatLng markerPosition in markerPositions) {
        _markers.add(
          Marker(
            markerId: MarkerId(markerPosition.toString()),
            position: markerPosition,
            icon: BitmapDescriptor.defaultMarker,
          ),
        );
      }
    });
  }

  Future<void> _handleDirections(String origin, String destination) async {
    var directions = await Location().getDirection(origin, destination);
    _changeCameraPosition(
      directions['start_location']['lat'],
      directions['start_location']['lng'],
      directions['northeast'],
      directions['southwest'],
    );
    _setPolyline(directions['polyline_decoded']);
  }

}

