
import 'package:flutter/material.dart';
import 'package:untitled4/main.dart';
import 'package:untitled4/screens/carModel.dart';
import 'package:untitled4/screens/user.dart';
import 'package:untitled4/trip.dart';
import 'package:untitled4/tripsContainer.dart';
import 'package:untitled4/firebase.dart';

import 'map.dart';

// void homeScreen() => runApp(MyApp());
//
// Future<void> main() async {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "homepage",
//       theme: ThemeData(
//         primarySwatch: Colors.lightBlue,
//       ),
//       home: Homepage(),
//     );
//   }
// }


class Homepage extends StatefulWidget {
  double carAutonomy;
  Homepage({required this.carAutonomy});
  @override
  HomepageState createState() => HomepageState(carAutonomy);
}

class HomepageState extends State<Homepage> {
  double carAutonomy;
  List<Trip> _trips = <Trip>[];
  HomepageState(this.carAutonomy);

  @override
  void initState() {
    super.initState();
    _fetchTrips();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(149.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
          ),
          child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Hello there,',
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
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: ClipOval(
                                  child: Container(
                                    width: 40, // Set the desired button width
                                    height: 40, // Set the desired button height
                                    color: Colors.white, // Set the desired button color
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.car_repair,
                                        size: 24, // Set the desired icon size
                                        color: Colors.black, // Set the desired icon color
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => CarModelScreen(),
                                        ));
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: ClipOval(
                                  child: Container(
                                    width: 40, // Set the desired button width
                                    height: 40, // Set the desired button height
                                    color: Colors.white, // Set the desired button color
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.person,
                                        size: 24, // Set the desired icon size
                                        color: Colors.black, // Set the desired icon color
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => UserScreen(),
                                        ));
                                        _fetchTrips();
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Container(
                        width: double.infinity,
                        height: 58,
                        child:
                          OutlinedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MapRouteInit(carAutonomy: carAutonomy,),
                              ));
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              textStyle: MaterialStateProperty.all<TextStyle>(
                                TextStyle(fontSize: 16.0), // Adjust the font size as desired
                              ),
                              foregroundColor: MaterialStateProperty.all<Color>(Color(0xFF777777)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Enter origin',
                                  style: TextStyle(
                                    color: Colors.grey[700], // Set text color to gray
                                    fontSize: 16.0, // Set text size
                                  ),
                                ),
                              ],
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


      body:  ListView.builder (
        itemCount: _trips.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(_trips[index].id),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
            ),
            onDismissed: (direction) {
              setState(() {
                Firebase().deleteTrip(_trips[index].id);
                print(_trips[index].id);
                _trips.removeAt(index);
              });
            },
            child : GestureDetector (
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MapRouteInit(carAutonomy: carAutonomy, origin: _trips[index].origin, destination: _trips[index].destination, tripUIID: _trips[index].id),
                ));
              },
            child: TripContainer(trip: _trips[index]),
            ),
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       _fetchTrips();
      //       });
      //     },
      //   child: Icon(Icons.refresh),
      //   backgroundColor: Color(0xFF0C747E),
      // ),
    );
  }

  void _fetchTrips() async {
    _trips = await Firebase().getTrips();
  }

}
