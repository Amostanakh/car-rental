import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashkai/constants/firebase_constants.dart';
import 'package:dashkai/screens/add_car2_screen.dart';
import 'package:dashkai/screens/add_car_screen.dart';
import 'package:dashkai/services/firestore_data_services.dart';
import 'package:flutter/material.dart';

class HostcarsScreen extends StatefulWidget {
  @override
  State<HostcarsScreen> createState() => _HostcarsScreenState();
}

class _HostcarsScreenState extends State<HostcarsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            const SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(
                height: 100,
              ),
              CircleAvatar(
                backgroundImage: Image.asset("assets/img_1.png").image,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${currentFirebaseUser!.email}',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.grey.shade500,
                      fontSize: 8,
                    ),
                  ),
                  const Text(
                    'Junior Brown',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 100,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddCar2Screen()));
                },
                child: const Row(
                  children: [
                    Text("Add Cars"),
                    Icon(
                      Icons.add_box_rounded,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ]),
          ],
          bottom: TabBar(
            labelPadding: const EdgeInsets.all(10),
            indicator: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10), // Creates border
                color: Colors.red.shade900), // Set indicator color to red
            labelColor: Colors.white, // Set selected tab label color to red
            unselectedLabelColor: Colors.black,
            isScrollable: true, // Add this for horizontal scrolling
            tabs: const [
              SizedBox(
                width: 150,
                child: Text(
                  'Approved',
                  style: TextStyle(),
                ),
              ),
              SizedBox(
                width: 150,
                child: Text(
                  'Pending',
                  style: TextStyle(),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [_approvedBookedCars(), _pendingRentalcars()],
        ),
      ),
    );
  }
}

Widget _approvedBookedCars() {
  GetFireStoreData recommendedCarsAvailable = GetFireStoreData();
  return StreamBuilder(
      stream: recommendedCarsAvailable.getPopularCarsData(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot upcomingCars = snapshot.data!.docs[index];
                return Card(
                  elevation: 5,
                  color: Colors.white,
                  child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Colors
                                .red, // Set your desired border color here
                            width: 2.0, // Set your desired border width here
                          ),
                        ),
                      ),
                      width: 350,
                      child: Stack(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Honda Fit',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  const Text(
                                    'Date added: 10/10/10',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                        color: Colors.grey),
                                  ),
                                  const SizedBox(height: 25),
                                  Row(
                                    children: [
                                      Checkbox(
                                          checkColor: Colors.white,
                                          activeColor:
                                              Colors.greenAccent.shade400,
                                          value: true,
                                          onChanged: (value) {}),
                                      Text(
                                        'Approved',
                                        style: TextStyle(
                                            color: Colors.greenAccent.shade400,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10)
                          ],
                        ),
                        Positioned(
                            right: 10,
                            top: 10,
                            child: Image.asset(
                              'assets/img_6.png',
                              width: 150,
                              height: 150,
                            ))
                      ])),
                );
              });
        }
        return const Center(child: CircularProgressIndicator());
      }));
}

Widget _pendingRentalcars() {
  GetFireStoreData recommendedCarsAvailable = GetFireStoreData();
  return StreamBuilder(
      stream: recommendedCarsAvailable.getPopularCarsData(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot upcomingCars = snapshot.data!.docs[index];
                return Card(
                  elevation: 5,
                  color: Colors.white,
                  child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Colors
                                .red, // Set your desired border color here
                            width: 2.0, // Set your desired border width here
                          ),
                        ),
                      ),
                      width: 350,
                      child: Stack(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Honda Fit',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  const Text(
                                    'Date added: 10/10/10',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                        color: Colors.grey),
                                  ),
                                  const SizedBox(height: 25),
                                  Row(
                                    children: [
                                      Container(
                                        width: 35,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.red.shade900,
                                        ),
                                        padding: const EdgeInsets.all(8),
                                        child: Image.asset(
                                          "assets/img_13.png",
                                          // width: 25,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Pending',
                                        style: TextStyle(
                                            color: Colors.red.shade900,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 10)
                          ],
                        ),
                        Positioned(
                            right: 10,
                            top: 10,
                            child: Image.asset(
                              'assets/img_6.png',
                              width: 150,
                              height: 150,
                            ))
                      ])),
                );
              });
        }
        return const Center(child: CircularProgressIndicator());
      }));
}
