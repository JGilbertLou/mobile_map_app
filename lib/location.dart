import 'dart:async';

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
}