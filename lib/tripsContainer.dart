import 'package:flutter/material.dart';
import 'package:untitled4/trip.dart';

class TripContainer extends StatelessWidget {
  final Trip trip;

  TripContainer({required this.trip});
  @override
  Widget build (BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
      child: Container(
        height: 100,
        color: Color(0xFFFF722D),
      ),
    );
  }
}