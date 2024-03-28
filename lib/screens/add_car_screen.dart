import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashkai/constants/firebase_constants.dart';
import 'package:dashkai/services/host_services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/date_picker_theme.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddCarScreen extends StatefulWidget {
  final List addingCar;
  const AddCarScreen({super.key, required this.addingCar});

  @override
  State<AddCarScreen> createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {
  String carImageUrl = '';
  HostServices addcarservices = HostServices();

  getimage() async {
    File file = File(widget.addingCar[0]['image']);
    var snapshot = await FirebaseStorage.instance
        .ref('Profile Picture/${DateTime.now().millisecondsSinceEpoch}')
        .putFile(file);
    var carDownloadUrl = await snapshot.ref.getDownloadURL();

    setState(() {
      carImageUrl = carDownloadUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    _addHostCarData() async {
      getimage();
      var mydata = widget.addingCar[0];
      mydata['fuelType'] = addcarservices.fuelTypeController.text;
      mydata['image'] = carImageUrl;
      mydata['fuelCapacity'] = addcarservices.fuelCapacityController.text;
      mydata['fuelConsuption'] = addcarservices.fuelConsumptionController.text;
      mydata['insuaranceFile'] = addcarservices.insuranceFileController.text;
      mydata['radioLicense'] = addcarservices.radioLicenseController.text;
      mydata['startingDate'] = addcarservices.startingDateController.text;
      mydata['endingDate'] = addcarservices.endingDateController.text;
      try {
        DocumentReference docRef =
            await FirebaseFirestore.instance.collection('mota').add(mydata);
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

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.red.shade900,
            )),
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 70),
          child: Column(
            children: [
              Text(
                'Add Car',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '02/02',
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Seats',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 370,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: addcarservices.seatsController,
                      style: const TextStyle(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Transmission',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 370,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: addcarservices.transmissionController,
                      style: const TextStyle(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Fuel Type',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 370,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: addcarservices.fuelTypeController,
                      style: const TextStyle(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Fuel Capacity',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 370,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: addcarservices.fuelCapacityController,
                      style: const TextStyle(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Fuel Consumption',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 370,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: addcarservices.fuelConsumptionController,
                      style: const TextStyle(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Insurance File',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 370,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: addcarservices.insuranceFileController,
                      style: const TextStyle(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Radio Licence File',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 370,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: addcarservices.radioLicenseController,
                      style: const TextStyle(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Starting Date',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: DatePickerWidget(
                      looping: false,
                      firstDate: DateTime.now(),
                      // lastDate: DateTime(2002, 1, 1),
                      // initialDate: DateTime.now(),
                      dateFormat: "dd/MMMM/yyyy",
                      locale: DatePicker.localeFromString(
                          'en'), // Set locale to English
                      onChange: (DateTime newDate, _) {
                        setState(() {
                          addcarservices.startingDateController.text =
                              newDate.toString();
                        });
                      },
                      pickerTheme: const DateTimePickerTheme(
                        backgroundColor: Colors
                            .white, // Set date picker background color to grey
                        itemTextStyle:
                            TextStyle(color: Colors.black, fontSize: 15),
                        dividerColor: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Ending Date',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: DatePickerWidget(
                      looping: false,
                      firstDate: DateTime.now(),
                      // lastDate: DateTime(2002, 1, 1),
                      // initialDate: DateTime.now(),
                      dateFormat: "dd/MMMM/yyyy",
                      locale: DatePicker.localeFromString(
                          'en'), // Set locale to English
                      onChange: (DateTime newDate, _) {
                        setState(() {
                          addcarservices.endingDateController.text =
                              newDate.toString();
                        });
                      },
                      pickerTheme: const DateTimePickerTheme(
                        backgroundColor: Colors
                            .white, // Set date picker background color to grey
                        itemTextStyle:
                            TextStyle(color: Colors.black, fontSize: 15),
                        dividerColor: Colors.black,
                      ),
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                        onPressed: () => _addHostCarData(),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.red.shade900),
                          minimumSize: MaterialStateProperty.resolveWith(
                              (states) => const Size(150, 40)),
                          shape: MaterialStateProperty.resolveWith(
                              (states) => RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  )),
                        ),
                        child: const Text(
                          'Continue',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
