import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashkai/services/firestore_data_services.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  GetFireStoreData notifications = GetFireStoreData();
  final now = DateTime.now();
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
              child: Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.red.shade900,
              )),
          title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                Text(
                  'Notifications',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          elevation: 0,
        ),
        body: SizedBox(
          height: screenHeight * 0.65,
          child: StreamBuilder(
              stream: notifications.getNotificationsData(),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot notifications =
                            snapshot.data!.docs[index];

                        // DateTime startDate = DateTime.parse(
                        //     notifications['timestamp'].toString());

                        // Duration difference = now.difference(startDate);
                        return GestureDetector(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 25),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Divider(
                                    height: 3, color: Colors.red.shade900),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.notifications_none,
                                      color: Colors.red.shade900,
                                    ),
                                    const Text(
                                      'Reminder!',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 60),
                                      child: Text('10 mins'),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 45),
                                child: Text("${notifications['content']}"),
                              ),
                              const SizedBox(height: 10),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 45),
                                child: Text(
                                  'View',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 2, 128, 231)),
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        );
                      });
                }
                return const SizedBox(child: Text('No data'));
              })),
        ),
      ),
    );
  }
}
