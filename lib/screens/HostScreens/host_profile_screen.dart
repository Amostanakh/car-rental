import 'package:dashkai/constants/firebase_constants.dart';
import 'package:dashkai/screens/home_screen.dart';
import 'package:dashkai/screens/notifications_screen.dart';
import 'package:dashkai/screens/settings_screen.dart';
import 'package:fluid_dialog/fluid_dialog.dart';
import 'package:flutter/material.dart';

import 'host_payments_screen.dart';

class HostProfileScreen extends StatefulWidget {
  const HostProfileScreen({super.key});
  @override
  State<HostProfileScreen> createState() => _HostProfileScreenState();
}

class _HostProfileScreenState extends State<HostProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
            child: Image.asset(
              'assets/logo.png',
              width: 150,
              height: 150,
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(
              height: 50,
            ),
            CircleAvatar(
              backgroundImage: Image.asset("assets/img_1.png").image,
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'juniorbrown@gmail.com',
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
              width: 150,
            ),
          ]),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Divider(height: 5, color: Color.fromARGB(232, 136, 22, 14)),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                                  height: 250,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Text(
                                          'Accounts',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium,
                                        ),
                                      ),
                                      const SizedBox(height: 16.0),
                                      const Text(
                                        'Host',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Container(
                                          width: 300,
                                          color: Colors.red.shade900,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                CircleAvatar(
                                                  backgroundImage: Image.asset(
                                                          'assets/img_1.png')
                                                      .image,
                                                ),
                                                const SizedBox(width: 10),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${currentFirebaseUser!.email}',
                                                      style: const TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    const Text(
                                                      'Junior Brown',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )),
                                      const SizedBox(height: 16.0),
                                      const Text(
                                        'Driver',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const HomeScreen()),
                                          );
                                        },
                                        child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                              color: Colors.red.shade900,
                                            )),
                                            width: 300,
                                            height: 50,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Switch to driver Account',
                                                    style: TextStyle(
                                                        color:
                                                            Colors.red.shade900,
                                                        fontSize: 18),
                                                  ),
                                                  const SizedBox(width: 30),
                                                  Icon(
                                                    Icons.add,
                                                    color: Colors.red.shade900,
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ));
                },
                child: Container(
                    width: 105,
                    height: 130,
                    child: const Card(
                      //surfaceTintColor: Color.fromARGB(255, 52, 55, 230),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 10, top: 10),
                            child: Center(
                              child: Icon(
                                Icons.switch_account,
                                size: 35,
                                color: Color.fromARGB(232, 136, 22, 14),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Switch Accounts',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
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
                                  height: 250,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Text(
                                          'View',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium,
                                        ),
                                      ),
                                      const SizedBox(height: 30),
                                      Center(
                                        child: Container(
                                            width: 250,
                                            color: Colors.grey.shade100,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'View National ID',
                                                    style: TextStyle(
                                                        color:
                                                            Colors.red.shade900,
                                                        fontSize: 18),
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ),
                                      const SizedBox(height: 30),
                                      Column(
                                        children: [
                                          Center(
                                            child: Container(
                                                width: 250,
                                                color: const Color.fromARGB(
                                                    255, 245, 245, 245),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'View Drivers License',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .red.shade900,
                                                            fontSize: 18),
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ));
                },
                child: Container(
                    width: 105,
                    height: 130,
                    child: const Card(
                      //surfaceTintColor: Color.fromARGB(255, 52, 55, 230),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 10, top: 10),
                            child: Center(
                              child: Icon(
                                Icons.copyright,
                                size: 35,
                                color: Color.fromARGB(232, 136, 22, 14),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Personal & Public Verifiers',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HostPaymentsScreen()),
                  );
                },
                child: Container(
                    width: 105,
                    height: 130,
                    child: const Card(
                      //surfaceTintColor: Color.fromARGB(255, 52, 55, 230),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 10, top: 10),
                            child: Center(
                              child: Icon(
                                Icons.attach_money,
                                size: 35,
                                color: Color.fromARGB(232, 136, 22, 14),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Bank & Payments',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              )
            ],
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Settings()),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.settings,
                  size: 30,
                  color: Color.fromARGB(232, 136, 22, 14),
                ),
                const SizedBox(width: 4),
                const Text(
                  'Settings',
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(width: 180),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.keyboard_arrow_right_sharp,
                    color: Color.fromARGB(232, 136, 22, 14),
                    size: 30,
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationsScreen()),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.notification_add,
                  size: 30,
                  color: Color.fromARGB(232, 136, 22, 14),
                ),
                const SizedBox(width: 4),
                const Text(
                  'Notifications',
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(width: 148),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.keyboard_arrow_right_sharp,
                    color: Color.fromARGB(232, 136, 22, 14),
                    size: 30,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 70),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 27),
            child: Row(
              children: [
                Icon(
                  Icons.logout_rounded,
                  size: 30,
                  color: Color.fromARGB(232, 136, 22, 14),
                ),
                SizedBox(width: 4),
                Text(
                  'LogOut',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    ));
  }
}
