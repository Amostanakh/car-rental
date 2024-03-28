import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashkai/screens/car_details_screen.dart';
import 'package:dashkai/services/firestore_data_services.dart';
import 'package:flutter/material.dart';

class RecommendationsScreen extends StatefulWidget {
  const RecommendationsScreen({super.key});

  @override
  State<RecommendationsScreen> createState() => _RecommendationsScreenState();
}

class _RecommendationsScreenState extends State<RecommendationsScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.red,
              )),
          title: const Text('Recommendations'),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: screenHeight * 0.75, child: _allrecommendedCars())
            ],
          ),
        ),
      ),
    );
  }
}

Widget _allrecommendedCars() {
  GetFireStoreData recommendedCarsAvailable = GetFireStoreData();

  return StreamBuilder(
      stream: recommendedCarsAvailable.getPopularCarsData(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot recommendedCars = snapshot.data!.docs[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CarDetails(
                                    recommendedCars: recommendedCars)),
                          );
                        },
                        child: SizedBox(
                            width: 330,
                            child: Card(
                              child: Container(
                                width: 330,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                      color: Colors
                                          .red, // Set your desired border color here
                                      width:
                                          2.0, // Set your desired border width here
                                    ),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(right: 10, top: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          recommendedCarsAvailable
                                              .addfavouritesData(
                                                  recommendedCars.id);
                                        },
                                        child: CircleAvatar(
                                          backgroundColor: Colors.red,
                                          radius: 20,
                                          child: Center(
                                            child: Icon(
                                              Icons.favorite_border,
                                              size: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, right: 35),
                                      child: Image.network(
                                        recommendedCars['image'],
                                        width: 220,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(15.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                recommendedCars['name'],
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                'Automatic',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.star_border,
                                                    color: Colors.amberAccent,
                                                  ),
                                                  Text(
                                                    '4.5',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                '\$ ${recommendedCars['price']}/ day',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 12,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                );
              });
        }
        return const Center(child: CircularProgressIndicator());
      }));
}
