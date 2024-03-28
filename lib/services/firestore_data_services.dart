import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashkai/constants/firebase_constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class GetFireStoreData {
  Stream<QuerySnapshot<Map<String, dynamic>>> getPopularCarsData() {
    var popularCars = FirebaseFirestore.instance.collection('cars').snapshots();
    return popularCars;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getRecomendedCarsData() {
    var popularCars =
        FirebaseFirestore.instance.collection('recommendedCars').snapshots();
    return popularCars;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getNotificationsData() {
    var carNotifications =
        FirebaseFirestore.instance.collection('notifications').snapshots();
    return carNotifications;
  }

  Future<void> addfavouritesData(String favCars) async {
    final DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance
            .collection('users')
            .doc(currentFirebaseUser!.uid)
            .get();
    final List<String> existingCars =
        snapshot.data()?['cars']?.cast<String>() ?? [];
    if (existingCars.contains(favCars)) {
      Fluttertoast.showToast(
          msg: "The car is already in Favorites list",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.black,
          fontSize: 16.0);
    } else {
      // 3. Add the new car to the array:
      existingCars.add(favCars);
      // 4. Update the document with the modified array:
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentFirebaseUser!.uid)
          .update({'cars': existingCars});
      Fluttertoast.showToast(
          msg: "Car Added Successfully in favourites",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.black,
          fontSize: 16.0);
    }
  }

  favouriteDataList() {
    Future<QuerySnapshot<Map<String, dynamic>>> fetchObjectsByIds(
        List<String> ids) async {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('id', whereIn: ids)
          .get();
      return snapshot;
    }
  }
}
