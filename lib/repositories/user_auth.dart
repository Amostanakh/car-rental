import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashkai/constants/firebase_constants.dart';
import 'package:dashkai/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserManagement {
  storeNewUser(
    user,
    context,
    // String phoneNumberController,
  ) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(currentFirebaseUser?.uid)
        .set({
      'email': user.email,
      'uid': user.uid,
      'cars': [],
      'pastRental': [],
      // 'phoneNumber': phoneNumberController,
    }).then((value) => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            ));
  }
}
