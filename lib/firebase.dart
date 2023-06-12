import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled4/trip.dart';
import 'package:uuid/uuid.dart';


class Firebase {

  String? addTrip(Trip trip) {
    var userID = _getUserID();
    print(userID);

    if (userID != null) {
      var uuid = Uuid();
      var tripID = uuid.v4();

      FirebaseFirestore.instance
          .collection('directions')
          .doc(userID)
          .collection('trips')
          .doc(tripID)
          .set({
        'origin': trip.origin,
        'destination': trip.destination,
        'velocity': trip.velocity,
        'time': trip.time,
      });
      return tripID;
    }
    return null;
  }

  void deleteTrip(String tripID) {
    var userID = _getUserID();

    if (userID != null) {
      FirebaseFirestore.instance
          .collection('directions')
          .doc(userID)
          .collection('trips')
          .doc(tripID)
          .delete();
    }
  }

  Future<List<Trip>> getTrips() async {
    var userID = _getUserID();
    List<Trip> trips = <Trip>[];

    if (userID != null) {
      FirebaseFirestore.instance
          .collection('directions')
          .doc(userID)
          .collection('trips')
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          print(doc['origin']);
          // Convert each document to a Contact object
          trips.add(
              Trip(
                doc.id,
                doc['origin'],
                doc['destination'],
                doc['velocity'],
                doc['time'],)
          );
          // Do something with the contact
        });
      });
    }
    return trips;
  }

  String? _getUserID() {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      return user.uid;
    }
    return null;
  }

}