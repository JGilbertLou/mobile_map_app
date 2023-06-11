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
//       home: MapRouteInit(),
//     );
//   }
// }

class MapRouteInit extends StatefulWidget {
  double carAutonomy;

  MapRouteInit({required this.carAutonomy});

  @override
  _MapRoute createState() => _MapRoute(carAutonomy);
}

class _MapRoute extends State<MapRouteInit> {
  double carAutonomy;

  _MapRoute(this.carAutonomy);

  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  TextEditingController _searchOriginController = TextEditingController();
  TextEditingController _searchDestinationController = TextEditingController();

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
    _setLocation(LatLng(40.453053, -3.688344));
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

}

