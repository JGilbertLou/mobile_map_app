import 'package:flutter/material.dart';
import 'package:untitled4/trip.dart';

class TripContainer extends StatelessWidget {
  final Trip trip;

  TripContainer({required this.trip});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
      child: Container(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  trip.origin,
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded (
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    trip.velocity,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  FractionallySizedBox(
                    widthFactor: 1, // 80% of the available width
                    child: Container(
                      color: Color(0xFF0C747E),
                      height: 3.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    trip.time,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              flex: 1,
              child: Center (
                child:  Text(
                  trip.destination,
                  style: const TextStyle (
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
