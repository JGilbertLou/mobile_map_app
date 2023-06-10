import 'dart:convert';
import 'package:flutter/services.dart';

class JsonReader {
  static Future<String> readValueFromJson() async {
    final jsonString = await rootBundle.loadString('Config/config.json');
    final jsonMap = jsonDecode(jsonString);
    final value = jsonMap['GOOGLE_KEY']; // Replace 'key' with the actual key in your JSON
    return value.toString();
  }
}
