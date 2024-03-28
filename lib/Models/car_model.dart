import 'package:cloud_firestore/cloud_firestore.dart';

class CarModel {
  final String id;
  final String make;
  final String model;
  final int year;
  final String color;
  final double mileage;
  final String? imageUrl;

  CarModel({
    required this.id,
    required this.make,
    required this.model,
    required this.year,
    required this.color,
    required this.mileage,
    this.imageUrl,
  });

  static fromFirestore(QueryDocumentSnapshot<Map<String, dynamic>> doc) {}
}
