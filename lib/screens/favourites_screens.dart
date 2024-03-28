import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashkai/constants/firebase_constants.dart';
import 'package:dashkai/services/firestore_data_services.dart';
import 'package:flutter/material.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  GetFireStoreData popularCarData = GetFireStoreData();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
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
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('users')
            .doc(currentFirebaseUser!.uid)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              if (snapshot.data!['cars'].isEmpty) {
                return const Center(
                  child: Text('Errors '),
                );
              } else {
                return ListView.builder(
                  padding: const EdgeInsets.all(12.0),
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data!["cars"].length,
                  itemBuilder: (context, index) {
                    return StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('cars')
                          .doc(snapshot.data!['cars'][index])
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.active) {
                          if (snapshot.hasData) {
                            Map<String, dynamic> cars = snapshot.data!.data()!;
                            return GestureDetector(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
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

                                        CachedNetworkImage(
                                          imageUrl: (cars['image']),
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            width: 200,
                                            height: 130,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.white70,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: imageProvider,
                                              ),
                                            ),
                                          ),
                                          placeholder: ((context, url) =>
                                              Container(
                                                width: 200,
                                                height: 130,
                                                alignment: Alignment.center,
                                                child: Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                          backgroundColor:
                                                              Colors.grey
                                                                  .shade800),
                                                ),
                                              )),
                                          errorWidget: ((context, url, eror) =>
                                              Container(
                                                  width: 200,
                                                  height: 130,
                                                  alignment: Alignment.center,
                                                  child: const Text(
                                                      'Network \n error...'))),
                                        ),

                                        // Image.network(
                                        //   cars['image'],
                                        // width: 200,
                                        // height: 130,
                                        // ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                                            const Text(
                                              '4.5',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            )
                                          ],
                                        ),
                                        const Divider(
                                            height: 3, color: Colors.red),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                Image.asset('assets/img_10.png',
                                                    width: 30, height: 30),
                                                Text(
                                                  '10KM/L',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color:
                                                          Colors.grey.shade500),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Image.asset('assets/img_11.png',
                                                    width: 30, height: 30),
                                                Text(
                                                  '10KM/L',
                                                  style: TextStyle(
                                                      fontSize: 5,
                                                      color:
                                                          Colors.grey.shade500),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Image.asset('assets/img_12.png',
                                                    width: 30, height: 30),
                                                Text(
                                                  'Auto',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color:
                                                          Colors.grey.shade500),
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
                          }
                        }

                        return const Center(child: CircularProgressIndicator());
                      },
                    );
                  },
                );
              }
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    )

        //   SingleChildScrollView(
        //     scrollDirection: Axis.vertical,
        //     child: Column(
        //       children: [
        //         const SizedBox(
        //           height: 20,
        //         ),
        //         SizedBox(
        //           height: screenHeight * 0.75,
        //           child: StreamBuilder(
        //               stream: popularCarData.getPopularCarsData(),
        //               builder: ((context, snapshot) {
        //                 if (snapshot.hasData) {
        //                   return ListView.builder(
        //                       scrollDirection: Axis.vertical,
        //                       itemCount: snapshot.data!.docs.length,
        //                       itemBuilder: (context, index) {
        //                         DocumentSnapshot cars =
        //                             snapshot.data!.docs[index];
        //                         return GestureDetector(
        //                           child: Padding(
        //                             padding: const EdgeInsets.symmetric(
        //                                 horizontal: 15),
        //                             child: Card(
        //                               color: Colors.white,
        //                               child: Padding(
        //                                 padding: const EdgeInsets.all(12.0),
        //                                 child: Column(
        //                                   crossAxisAlignment:
        //                                       CrossAxisAlignment.start,
        //                                   children: [
        //                                     Text(
        //                                       cars['name'],
        //                                       style: const TextStyle(
        //                                           fontWeight: FontWeight.bold,
        //                                           fontSize: 15),
        //                                     ),

        //                                     CachedNetworkImage(
        //                                       imageUrl: (cars['image']),
        //                                       imageBuilder:
        //                                           (context, imageProvider) =>
        //                                               Container(
        //                                         width: 200,
        //                                         height: 130,
        //                                         decoration: BoxDecoration(
        //                                           borderRadius:
        //                                               BorderRadius.circular(5),
        //                                           color: Colors.white70,
        //                                           image: DecorationImage(
        //                                             fit: BoxFit.cover,
        //                                             image: imageProvider,
        //                                           ),
        //                                         ),
        //                                       ),
        //                                       placeholder: ((context, url) =>
        //                                           Container(
        //                                             width: 200,
        //                                             height: 130,
        //                                             alignment: Alignment.center,
        //                                             child: Center(
        //                                               child:
        //                                                   CircularProgressIndicator(
        //                                                       backgroundColor:
        //                                                           Colors.grey
        //                                                               .shade800),
        //                                             ),
        //                                           )),
        //                                       errorWidget: ((context, url,
        //                                               eror) =>
        //                                           Container(
        //                                               width: 200,
        //                                               height: 130,
        //                                               alignment: Alignment.center,
        //                                               child: const Text(
        //                                                   'Network \n error...'))),
        //                                     ),

        //                                     // Image.network(
        //                                     //   cars['image'],
        //                                     // width: 200,
        //                                     // height: 130,
        //                                     // ),
        //                                     Row(
        //                                       children: [
        //                                         Column(
        //                                           crossAxisAlignment:
        //                                               CrossAxisAlignment.start,
        //                                           children: [
        //                                             Text(
        //                                               '\$ ${cars['price']}/ day',
        //                                               style: const TextStyle(
        //                                                   color: Colors.red,
        //                                                   fontWeight:
        //                                                       FontWeight.bold,
        //                                                   fontSize: 14),
        //                                             ),
        //                                             Text(
        //                                               '\$ ${cars['price']} est. total',
        //                                               style: const TextStyle(
        //                                                   color: Colors.red,
        //                                                   fontSize: 12),
        //                                             ),
        //                                           ],
        //                                         ),
        //                                         const SizedBox(width: 170),
        //                                         const Text(
        //                                           '4.5',
        //                                           style: TextStyle(
        //                                               fontWeight: FontWeight.bold,
        //                                               fontSize: 20),
        //                                         )
        //                                       ],
        //                                     ),
        //                                     const Divider(
        //                                         height: 3, color: Colors.red),
        //                                     Row(
        //                                       mainAxisAlignment:
        //                                           MainAxisAlignment.spaceBetween,
        //                                       children: [
        //                                         Column(
        //                                           children: [
        //                                             Image.asset(
        //                                                 'assets/img_10.png',
        //                                                 width: 30,
        //                                                 height: 30),
        //                                             Text(
        //                                               '10KM/L',
        //                                               style: TextStyle(
        //                                                   fontSize: 10,
        //                                                   color: Colors
        //                                                       .grey.shade500),
        //                                             )
        //                                           ],
        //                                         ),
        //                                         Column(
        //                                           children: [
        //                                             Image.asset(
        //                                                 'assets/img_11.png',
        //                                                 width: 30,
        //                                                 height: 30),
        //                                             Text(
        //                                               '10KM/L',
        //                                               style: TextStyle(
        //                                                   fontSize: 5,
        //                                                   color: Colors
        //                                                       .grey.shade500),
        //                                             )
        //                                           ],
        //                                         ),
        //                                         Column(
        //                                           children: [
        //                                             Image.asset(
        //                                                 'assets/img_12.png',
        //                                                 width: 30,
        //                                                 height: 30),
        //                                             Text(
        //                                               'Auto',
        //                                               style: TextStyle(
        //                                                   fontSize: 10,
        //                                                   color: Colors
        //                                                       .grey.shade500),
        //                                             )
        //                                           ],
        //                                         ),
        //                                       ],
        //                                     )
        //                                   ],
        //                                 ),
        //                               ),
        //                             ),
        //                           ),
        //                         );
        //                       });
        //                 }
        //                 return const SizedBox(child: Text('No data'));
        //               })),
        //         )
        //       ],
        //     ),
        //   ),
        // ),

        );
  }
}
