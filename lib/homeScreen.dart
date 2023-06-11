import 'package:flutter/material.dart';
import 'package:untitled4/main.dart';
import 'package:untitled4/trip.dart';
import 'package:untitled4/tripsContainer.dart';

// void homeScreen() => runApp(MyApp());

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "homepage",
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Homepage(),
    );
  }
}


class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<Trip> _trips = [
    Trip('Barcelona', 'Madrid', '40kW/h', '2:30'),
    Trip('Milan', 'Venice', '40kW/h', '2:30'),
    Trip('Zaragoza', 'Seville', '40kW/h', '2:30'),
    Trip('Washington DC', 'Houston', '40kW/h', '2:30'),
    Trip('Lyon', 'Oslo', '40kW/h', '2:30'),
    Trip('Lyon', 'Oslo', '40kW/h', '2:30'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(145.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(45.0),
          ),
          child: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                color: Color(0xFFFF722D),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0), // Add top padding here
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hello,',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Where are we travelling next?',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      TextFormField(
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                          hintText: 'Enter origin',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),


      body: ListView.builder(
        itemCount: _trips.length,
        itemBuilder: (context, index) {
          return TripContainer(trip: _trips[index],);
        },
      )
    );
  }
}
