import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashkai/constants/firebase_constants.dart';
import 'package:dashkai/screens/filter_screen.dart';
import 'package:dashkai/screens/notifications_screen.dart';
import 'package:dashkai/screens/recommendations_screen.dart';
import 'package:dashkai/screens/search_screen.dart';
import 'package:dashkai/services/firestore_data_services.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class HomeDesign extends StatefulWidget {
  const HomeDesign({super.key});

  @override
  State<HomeDesign> createState() => _HomeDesignState();
}

class _HomeDesignState extends State<HomeDesign> {
  GetStorage getStorage = GetStorage();
  GetFireStoreData popularCarData = GetFireStoreData();
  Future<dynamic> getUser() async => await getStorage.read("user");
  @override
  Widget build(BuildContext context) {
    getUser();
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(children: [
        const SizedBox(
          height: 25,
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
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
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
            width: 150,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationsScreen()));
            },
            child: const Icon(
              Icons.notifications,
              color: Colors.red,
            ),
          ),
        ]),

        // Unleash your driving part
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Card(
            color: Colors.grey.shade100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Text(
                  'Unleash your driving desires.',
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
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchScreen()),
                        );
                      },
                      child: Container(
                        width: 200,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Search',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey.shade400,
                                fontSize: 12,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const FilterScreen()),
                                );
                              },
                              child: Icon(
                                Icons.search,
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FilterScreen()),
                          );
                        },
                        child: const Icon(Icons.filter_alt_outlined,
                            color: Colors.red)),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Card(
            color: Colors.grey.shade100,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Cars',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                          color: MaterialStateColor.resolveWith(
                              (states) => Colors.black)),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchScreen()),
                        );
                      },
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const RecommendationsScreen()),
                          );
                        },
                        child: Text(
                          'View All',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.grey.shade800,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                //popular cars
                SizedBox(
                    height: 120,
                    child: StreamBuilder(
                      stream: popularCarData.getPopularCarsData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(top: 2),
                                height: 100,
                                child: ListView.separated(
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          const SizedBox(
                                    width: 1,
                                  ),
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: snapshot.data!.docs.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, position) {
                                    DocumentSnapshot cars =
                                        snapshot.data!.docs[position];
                                    return GestureDetector(
                                      child: Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Container(
                                                width:
                                                    90, // Adjust the width to your preference
                                                height:
                                                    65, // Adjust the height to your preference
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0), // Adjust the radius for rounded corners
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        cars['image']),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              cars['name'],
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    )),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Text(
              'Recomendations',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color:
                      MaterialStateColor.resolveWith((states) => Colors.black)),
            ),
            const SizedBox(
              width: 140,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RecommendationsScreen()),
                );
              },
              child: Text(
                'View All',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.grey.shade800,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        SizedBox(
            height: 200,
            child: StreamBuilder(
              stream: popularCarData.getPopularCarsData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 2),
                        height: 190,
                        child: ListView.separated(
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(
                            width: 1,
                          ),
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data!.docs.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, position) {
                            DocumentSnapshot cars =
                                snapshot.data!.docs[position];
                            return GestureDetector(
                              child: Card(
                                color: Colors.grey.shade100,
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
                                          fontSize: 15,
                                        ),
                                      ),
                                      Image.network(
                                        cars['image'],
                                        width: 200,
                                        height: 100,
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '\$${cars['price']}/ day',
                                                style: const TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Text(
                                                '\$${cars['price']} est. total',
                                                style: const TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 150),
                                          const Text(
                                            'Top Class',
                                            // yourCarDataList[index].rating,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  return const SizedBox();
                }
              },
            )),
      ]),
    );
  }
}
