// import 'package:cloud_firestore/cloud_firestore.dart';

// class FirestoreRepository {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<Stream<QuerySnapshot<Map<String, dynamic>>>?> getallCarData() async {
//     try {
//       _firestore
//           .collection('cars')
//           .snapshots()
//           .map((snapshot) => {print(snapshot.docs)});
//     } catch (e) {
//       print('Error fetching car data: $e');
//       return null;
//     }
//     return null;
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';

// class CarService {
//   final CollectionReference carsCollection =
//       FirebaseFirestore.instance.collection('cars');

//   getCarsStream() {
//     return carsCollection.snapshots().map((snapshot) {
//       return snapshot.docs.map((doc) => doc.data()).toList();
//     });
//   }
// }
