import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashkai/constants/firebase_constants.dart';
import 'package:dashkai/services/firestore_data_services.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  GetFireStoreData popularCarData = GetFireStoreData();
  String carName = "";
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
              child: const Icon(Icons.arrow_back_ios, color: Colors.red)),
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
              const Icon(
                Icons.notifications,
                color: Colors.red,
              ),
            ]),
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Card(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      'Unleash your driving desires',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: MaterialStateColor.resolveWith(
                              (states) => Colors.grey.shade700)),
                    ),
                    Text(
                      'Pick your perfect ride',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade400,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 200,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            style: const TextStyle(),
                            decoration: const InputDecoration(
                              hintText: 'Search car',
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                            onChanged: (val) {
                              setState(() {
                                carName = val;
                              });
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        const Icon(Icons.filter_alt_outlined,
                            color: Colors.red),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.65,
                child: StreamBuilder(
                    stream: popularCarData.getPopularCarsData(),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot cars =
                                  snapshot.data!.docs[index];
                              if (cars['name']
                                  .toString()
                                  .toLowerCase()
                                  .startsWith(carName.toLowerCase())) {
                                return GestureDetector(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Card(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              cars['name'],
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                            Image.network(
                                              cars['image'],
                                              width: 200,
                                              height: 130,
                                            ),
                                            Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '\$ ${cars['price']}/ day',
                                                      style: const TextStyle(
                                                          color: Colors.red,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14),
                                                    ),
                                                    Text(
                                                      '\$ ${cars['price']} est. total',
                                                      style: const TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(width: 170),
                                                const Text(
                                                  '4.5',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                )
                                              ],
                                            ),
                                            const Divider(
                                                height: 3, color: Colors.red),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    Image.asset(
                                                        'assets/img_10.png',
                                                        width: 30,
                                                        height: 30),
                                                    Text(
                                                      '10KM/L',
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors
                                                              .grey.shade500),
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Image.asset(
                                                        'assets/img_11.png',
                                                        width: 30,
                                                        height: 30),
                                                    Text(
                                                      '10KM/L',
                                                      style: TextStyle(
                                                          fontSize: 5,
                                                          color: Colors
                                                              .grey.shade500),
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Image.asset(
                                                        'assets/img_12.png',
                                                        width: 30,
                                                        height: 30),
                                                    Text(
                                                      'Auto',
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors
                                                              .grey.shade500),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return const SizedBox();
                              }
                            });
                      }
                      return const SizedBox(child: Text('No data'));
                    })),
              )
            ],
          ),
        ),
      ),
    );
  }
}
