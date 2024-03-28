import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashkai/services/firestore_data_services.dart';
import 'package:flutter/material.dart';

class MyTripsScreen extends StatefulWidget {
  @override
  State<MyTripsScreen> createState() => _MyTripsScreenState();
}

class _MyTripsScreenState extends State<MyTripsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('My Trips'),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.notifications_none),
            )
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
                  'Upcoming rentals',
                  style: TextStyle(),
                ),
              ),
              SizedBox(
                width: 150,
                child: Text(
                  'Past Rentals',
                  style: TextStyle(),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [_upcomingBookedCars(), _pastBookedCars()],
        ),
      ),
    );
  }
}

Widget _pastBookedCars() {
  return Card(
    elevation: 5,
    color: Colors.white,
    child: Container(
        height: 270,
        width: 350,
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Honda Fit 2019',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: Colors.red.shade900,
                        ),
                        const SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Collection Date',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                            Text(
                              '10/10/10',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                  color: Colors.grey.shade500),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.gps_fixed,
                          color: Colors.red.shade900,
                        ),
                        const SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Collection Point',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                            Text(
                              '24 Lyndhurst,\n Monavale,\n Harare',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                  color: Colors.grey.shade500),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.lock_clock,
                          color: Colors.red.shade900,
                        ),
                        const SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Duration',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                            Text(
                              '5 days',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                  color: Colors.grey.shade500),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: 180.0,
                      height: 50.0,
                      child: const Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(
                            Icons.stars_sharp,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'CONFIRMED',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent.shade400,
                        shape:
                            BoxShape.rectangle, // Change the shape to rectangle
                        borderRadius:
                            BorderRadius.circular(10), // Add this line
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              right: 0,
              top: 10,
              child: Image.asset(
                'assets/img_6.png',
                width: 200,
                height: 220,
              ))
        ])),
  );
}

Widget _upcomingBookedCars() {
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
                  child: SizedBox(
                      height: 270,
                      width: 350,
                      child: Stack(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Honda Fit 2019',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_month,
                                        color: Colors.red.shade900,
                                      ),
                                      const SizedBox(width: 5),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Collection Date',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),
                                          ),
                                          Text(
                                            '10/10/10',
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 12,
                                                color: Colors.grey.shade500),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.gps_fixed,
                                        color: Colors.red.shade900,
                                      ),
                                      const SizedBox(width: 5),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Collection Point',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),
                                          ),
                                          Text(
                                            '24 Lyndhurst,\n Monavale,\n Harare',
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 12,
                                                color: Colors.grey.shade500),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.lock_clock,
                                        color: Colors.red.shade900,
                                      ),
                                      const SizedBox(width: 5),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Duration',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),
                                          ),
                                          Text(
                                            '5 days',
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 12,
                                                color: Colors.grey.shade500),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  GestureDetector(
                                    onTap: () {
                                      recommendedCarsAvailable
                                          .favouriteDataList();
                                    },
                                    child: Container(
                                      width: 180.0,
                                      height: 50.0,
                                      child: const Row(
                                        children: [
                                          SizedBox(width: 10),
                                          Icon(
                                            Icons.stars_sharp,
                                            color: Colors.white,
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            'CONFIRMED',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          )
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.greenAccent.shade400,
                                        shape: BoxShape
                                            .rectangle, // Change the shape to rectangle
                                        borderRadius: BorderRadius.circular(
                                            10), // Add this line
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                            right: 0,
                            top: 10,
                            child: Image.asset(
                              'assets/img_6.png',
                              width: 200,
                              height: 220,
                            ))
                      ])),
                );
              });
        }
        return const Center(child: CircularProgressIndicator());
      }));
}
