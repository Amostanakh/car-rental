import 'package:card_swiper/card_swiper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashkai/screens/order_screen.dart';
import 'package:fluid_dialog/fluid_dialog.dart';
import 'package:flutter/material.dart';

class CarDetails extends StatelessWidget {
  final DocumentSnapshot recommendedCars;
  CarDetails({super.key, required this.recommendedCars});

  final List<String> imageAssetPaths = [
    // 'assets/img_2.png',
    // 'assets/gle1.png',
    // 'assets/gle2.jpg',
    // 'assets/gle3.png',
  ];

  List<String> complianceDocuments = [
    'Document 1',
    'Document 2',
    'Document 3',
    // Add more documents as needed
  ];

  @override
  Widget build(BuildContext context) {
    final List<String> imageAssetPaths = [
      recommendedCars['image']

      // 'assets/img_2.png',
      // 'assets/gle1.png',
      // 'assets/gle2.jpg',
      // 'assets/gle3.png',
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Mercedes Benz"),
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios, color: Colors.red)),
          actions: [
            const SizedBox(
              width: 50,
              child: Icon(
                Icons.share,
                color: Colors.red,
              ),
            ),
          ],
        ),
        body: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 280,
                width: 280,
                child: Swiper(
                  itemCount: imageAssetPaths.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network(
                      imageAssetPaths[index],
                      height: 200,
                      width: 200,
                    );
                  },
                  pagination: const SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      color: Colors.grey, // Set the color of inactive dots
                      activeColor:
                          Colors.red, // Set the color of the active dot
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Specifications",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 130,
                  width: 170,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.speed_sharp,
                            size: 60,
                            color: Colors.grey.shade500,
                          ),
                          const Text("Fuel Consumption"),
                          Text("\$ ${recommendedCars['fuelconsumption']}" +
                              '/100km'),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 130,
                  width: 170,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.people_sharp,
                            size: 60,
                            color: Colors.grey.shade500,
                          ),
                          const Text("Capacity"),
                          Text(recommendedCars['capacity']),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 130,
                  width: 170,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.car_crash,
                            size: 50,
                            color: Colors.grey.shade500,
                          ),
                          const Text(
                            "Transmission",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            recommendedCars['transimision'],
                            style:
                                const TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => FluidDialog(
                              rootPage: FluidDialogPage(
                                alignment: Alignment.center,
                                builder: (context) => Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    height: 400,
                                    child: Column(
                                      children: [
                                        Text(
                                          'Compliance Documents',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium,
                                        ),
                                        const SizedBox(height: 16.0),
                                        Row(
                                          children: [
                                            const Text(
                                              'Insurance',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            const SizedBox(width: 140.0),
                                            recommendedCars['compliencedocs'][0]
                                                        ['Insurance'] ==
                                                    'true'
                                                ? Checkbox(
                                                    checkColor:
                                                        Colors.greenAccent,
                                                    activeColor:
                                                        Colors.grey.shade100,
                                                    value: true,
                                                    onChanged: (value) {})
                                                : Checkbox(
                                                    checkColor: Colors.red,
                                                    activeColor:
                                                        Colors.grey.shade100,
                                                    value: true,
                                                    onChanged: (value) {}),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Vehicle Registration',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            const SizedBox(width: 50.0),
                                            Checkbox(
                                                checkColor: Colors.greenAccent,
                                                activeColor:
                                                    Colors.grey.shade100,
                                                value: true,
                                                onChanged: (value) {}),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Proof of Insurance',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            const SizedBox(width: 65.0),
                                            Checkbox(
                                                checkColor: Colors.greenAccent,
                                                activeColor:
                                                    Colors.grey.shade100,
                                                value: true,
                                                onChanged: (value) {}),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Owner\'s Manual',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            const SizedBox(width: 90.0),
                                            Checkbox(
                                                checkColor: Colors.greenAccent,
                                                activeColor:
                                                    Colors.grey.shade100,
                                                value: true,
                                                onChanged: (value) {}),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Service Records',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            const SizedBox(width: 90.0),
                                            Checkbox(
                                                checkColor: Colors.greenAccent,
                                                activeColor:
                                                    Colors.grey.shade100,
                                                value: true,
                                                onChanged: (value) {}),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Rental Agreements',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            const SizedBox(width: 60.0),
                                            Checkbox(
                                                checkColor: Colors.greenAccent,
                                                activeColor:
                                                    Colors.grey.shade100,
                                                value: true,
                                                onChanged: (value) {}),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ));
                  },
                  child: Container(
                    height: 130,
                    width: 170,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.file_copy_sharp,
                              size: 40,
                              color: Colors.grey.shade500,
                            ),
                            const Text(
                              "Compliance Docs",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text("LHD"),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Total Price",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey),
                      ),
                      Text(
                        "\$${recommendedCars['price']}/day",
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 100,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OrderScreen()),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.red),
                      minimumSize: MaterialStateProperty.resolveWith(
                          (states) => const Size(150, 50)),
                      shape: MaterialStateProperty.resolveWith(
                          (states) => RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              )),
                    ),
                    child: const Text(
                      'Book Now',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
