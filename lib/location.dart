import 'dart:async';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'config.dart';

class Location {

  Future<String> getLocationId(String location) async {
    final String apiKey = await JsonReader.readValueFromJson();
    final String apiUrl = 'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$location&inputtype=textquery&key=$apiKey';
    var response = await http.get(Uri.parse(apiUrl));
    var json = convert.jsonDecode(response.body);
    var locationId = json['candidates'][0]['place_id'] as String;
    return locationId;
  }

  Future<Map<String, dynamic>> getLocation(String location) async {
    final String apiKey = await JsonReader.readValueFromJson();
    final placeId = await getLocationId(location);
    final String apiUrl = "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKey";
    var response = await http.get(Uri.parse(apiUrl));
    var json = convert.jsonDecode(response.body);
    var locations = json['result'] as Map<String, dynamic>;
    return locations;
  }


  Future<Map<String, dynamic>> getDirection(String? origin, String? destination) async {
    final String apiKey = await JsonReader.readValueFromJson();
    final String apiUrl = "https://maps.googleapis.com/maps/api/directions/json?origin=$origin&destination=$destination&key=$apiKey";
    var response = await http.get(Uri.parse(apiUrl));
    var json = convert.jsonDecode(response.body);

    var directions = {
      'northeast': json['routes'][0]['bounds']['northeast'],
      'southwest': json['routes'][0]['bounds']['southwest'],
      'start_location': json['routes'][0]['legs'][0]['start_location'],
      'end_location': json['routes'][0]['legs'][0]['end_location'],
      'polyline': json['routes'][0]['overview_polyline']['points'],
      'polyline_decoded': PolylinePoints().decodePolyline(json['routes'][0]['overview_polyline']['points']),
    };
    return directions;
  }

  Future<LatLng> findNearestEStation(LatLng origin, LatLng destination) async {
    final String apiKey = await JsonReader.readValueFromJson();
    final String apiUrl = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${origin.latitude},${origin.longitude}&rankby=distance&type=gas_station&key=$apiKey";
    var response = await http.get(Uri.parse(apiUrl));
    var json = convert.jsonDecode(response.body);

    if (json['results'] != null && json['results'].length > 0) {
      var station = json['results'][0];
      double lat = station['geometry']['location']['lat'];
      double lng = station['geometry']['location']['lng'];
      LatLng nearestStation = LatLng(lat, lng);
      return nearestStation;
    }

    // If no gas station is found, return the destination point
    return destination;
  }
}