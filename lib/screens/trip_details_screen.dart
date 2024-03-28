import 'package:flutter/material.dart';

class TripDetalsScreen extends StatefulWidget {
  const TripDetalsScreen({super.key});

  @override
  State<TripDetalsScreen> createState() => _TripDetalsScreenState();
}

class _TripDetalsScreenState extends State<TripDetalsScreen> {
  @override
  Widget build(BuildContext context) {
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
                color: Colors.red,
              )),
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                Text(
                  'Trip Details',
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
        body: Column(children: [
          //SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/img_2.png',
                  width: 200,
                  height: 200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  'Mercedes-Compact',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  '13 January-17 January',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.grey),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Specifications',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                        width: 150,
                        child: Card(
                          surfaceTintColor: Color.fromARGB(255, 52, 55, 230),
                          child: Container(
                            width: 330,
                            decoration: BoxDecoration(
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 10, top: 10),
                                  child: Icon(
                                    Icons.gps_fixed,
                                    size: 35,
                                    color: Colors.black,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Distance Covered',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        '365km',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                    SizedBox(width: 3),
                    Container(
                        width: 150,
                        child: Card(
                          surfaceTintColor: Color.fromARGB(255, 165, 238, 82),
                          child: Container(
                            width: 330,
                            decoration: BoxDecoration(
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 10, top: 10),
                                  child: Icon(
                                    Icons.car_crash_outlined,
                                    size: 35,
                                    color: Colors.black,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Car Status',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        'Excellent',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                    SizedBox(width: 3),
                    Container(
                        width: 150,
                        child: Card(
                          surfaceTintColor: Color.fromARGB(255, 45, 128, 197),
                          child: Container(
                            width: 330,
                            decoration: BoxDecoration(
                             
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 10, top: 10),
                                  child: Icon(
                                    Icons.two_wheeler_rounded,
                                    size: 35,
                                    color: Colors.black,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Wheels Status',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        'Perfect',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  'Car Returned With Prejudice',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                      checkColor: Colors.greenAccent,
                      activeColor: Colors.green.shade600,
                      value: true,
                      onChanged: (value) {}),
                  Text(
                    'Free cancellation up to 48hrs before pickup',
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      checkColor: Colors.greenAccent,
                      activeColor: Colors.green.shade600,
                      value: true,
                      onChanged: (value) {}),
                  Text(
                    'Car in perfect condition',
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      checkColor: Colors.greenAccent,
                      activeColor: Colors.green.shade600,
                      value: true,
                      onChanged: (value) {}),
                  Text(
                    'Up to 365km',
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                  ),
                ],
              ),
              
              SizedBox(height: 20),
              Column(
                children: [
                  Center(
            child: ElevatedButton(
                  onPressed: (){
                    
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith((states) => Colors.red),
                    minimumSize: MaterialStateProperty.resolveWith((states) => Size(180, 40)),
                    shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )
                    ),
                  ),
                  child: Text(
                    'Tell Us About Your Trip',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12
                    ),
            
                  )
              ),
          ),
                ],
              )
            ],
          ),
        
        ]),
      ),
    );
  }
}
