import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashkai/constants/firebase_constants.dart';
import 'package:dashkai/screens/HostScreens/host_create.dart';
import 'package:dashkai/screens/HostScreens/host_home_screen.dart.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class HostServices {
  TextEditingController hostNameController = TextEditingController();
  TextEditingController numberOfCarsController = TextEditingController();
  TextEditingController seatsController = TextEditingController();
  TextEditingController transmissionController = TextEditingController();
  TextEditingController fuelTypeController = TextEditingController();
  TextEditingController fuelCapacityController = TextEditingController();
  TextEditingController fuelConsumptionController = TextEditingController();
  TextEditingController insuranceFileController = TextEditingController();
  TextEditingController radioLicenseController = TextEditingController();
  TextEditingController startingDateController = TextEditingController();
  TextEditingController endingDateController = TextEditingController();

  //second formsfields
  TextEditingController carIdController = TextEditingController();
  TextEditingController registrationNumberController = TextEditingController();
  TextEditingController chasisNumberController = TextEditingController();
  TextEditingController engineNumberController = TextEditingController();
  TextEditingController carDescriptionController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  String selectedImage = '';
  Future<void> addHostData(context) async {
    var hostName = currentFirebaseUser!.email;
    var snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentFirebaseUser!.uid)
        .get();
    var existingHostName = snapshot.data()?['subuser'] ?? [];
    if (!existingHostName
        .any((hostexist) => hostexist['hostName'] == hostName)) {
      existingHostName.add({
        'hostEmail': hostName,
        'hostUserName': hostNameController.text,
        'NumberOfCars': numberOfCarsController.text,
        'hostcarsadd': [],
      });
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentFirebaseUser!.uid)
          .update({'subuser': existingHostName});
      Fluttertoast.showToast(
          msg: "Successfully added hostName $hostName",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.black,
          fontSize: 16.0);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HostScreen()),
      );
    } else {
      Fluttertoast.showToast(
          msg: "$hostName is already a Host",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.black,
          fontSize: 16.0);
    }
  }

  //Switch function
  void switchToHostAccount(context) async {
    var snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentFirebaseUser!.uid)
        .get();
    var existingHostName = snapshot.data();
    if (existingHostName?['subuser'].isEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CreateHost()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HostScreen()),
      );
    }
  }

  //Text Services on switching
  Future<Widget> switchToHostAccText(context) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentFirebaseUser!.uid)
        .get();
    final existingSubusers = snapshot.data()?['subuser'];
    if (existingSubusers?.isEmpty ?? true) {
      return Text(
        'Create Host Account',
        style: TextStyle(color: Colors.red.shade900, fontSize: 18),
      );
    } else {
      // Assuming the hostName is in the first element of subuser
      final hostEmail = existingSubusers?[0]['hostUserName'];
      return Text(
        hostEmail ?? 'email.com', // Handle potential null email
        style: TextStyle(color: Colors.red.shade900, fontSize: 18),
      );
    }
  }

  // Add car

  Future<void> hostAddcarFirstScreen(Map<String, dynamic> addCar) async {
    File file = File(selectedImage);
    var snapshot = await FirebaseStorage.instance
        .ref('Profile Picture/${DateTime.now().millisecondsSinceEpoch}')
        .putFile(file);
    var carImageUrl = await snapshot.ref.getDownloadURL();
    try {
      DocumentReference docRef =
          await FirebaseFirestore.instance.collection('mota').add(addCar

              //{
              // 'CarId': carIdController.text,
              // 'registrationBookNumber': registrationNumberController.text,
              // 'chasisNumber': chasisNumberController.text,
              // 'engineNumber': engineNumberController.text,
              // 'carDiscription': carDescriptionController.text,
              // 'title': titleController.text,
              // 'image': carImageUrl,

              //}

              );
      String documentId = docRef.id;
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentFirebaseUser!.uid)
          .get();
      var existingSubusers = snapshot.data()?['subuser'] ?? [];
      if (existingSubusers.isEmpty) {
        existingSubusers = [
          {}
        ]; // Create an empty subuser object if none exists
      }
      final firstSubuser = existingSubusers[0];
      firstSubuser['hostcarsadd'] ??=
          []; // Create the 'hostcarsadd' array if it doesn't exist
      firstSubuser['hostcarsadd'].add(documentId);

      // Update the user document with the modified subuser data
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentFirebaseUser!.uid)
          .update({'subuser': existingSubusers});

      Fluttertoast.showToast(
          msg: "Car Succefully Added",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.black,
          fontSize: 16.0);
    } catch (error) {
      Fluttertoast.showToast(
          msg: "An Error Accored try again",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.black,
          fontSize: 16.0);
    }
  }
}
