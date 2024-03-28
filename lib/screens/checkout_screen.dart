import 'package:fluid_dialog/fluid_dialog.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
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
            title: Center(
              child: Text('Checkout'),
            ),
            elevation: 0,
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Payment Methods',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => HomeScreen()),
                              // );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.white),
                              side: MaterialStateProperty.resolveWith((states) =>
                                  BorderSide(color: Colors.red)), // Red border
                              minimumSize: MaterialStateProperty.resolveWith(
                                  (states) => Size(100, 40)),
                              shape: MaterialStateProperty.resolveWith(
                                  (states) => RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      )),
                            ),
                            child: Text(
                              'Ecocash',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            )),
                        SizedBox(width: 10),
                        ElevatedButton(
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => HomeScreen()),
                              // );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.red),
                              minimumSize: MaterialStateProperty.resolveWith(
                                  (states) => Size(100, 40)),
                              shape: MaterialStateProperty.resolveWith(
                                  (states) => RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      )),
                            ),
                            child: Text(
                              'VISA',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            )),
                        SizedBox(width: 10),
                        ElevatedButton(
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => HomeScreen()),
                              // );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.white),
                              side: MaterialStateProperty.resolveWith((states) =>
                                  BorderSide(color: Colors.red)), // Red border
                              minimumSize: MaterialStateProperty.resolveWith(
                                  (states) => Size(100, 40)),
                              shape: MaterialStateProperty.resolveWith(
                                  (states) => RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      )),
                            ),
                            child: Text(
                              'Cash on delivery',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            )),
                        SizedBox(width: 10),
                        ElevatedButton(
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => HomeScreen()),
                              // );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.white),
                              side: MaterialStateProperty.resolveWith((states) =>
                                  BorderSide(color: Colors.red)), // Red border
                              minimumSize: MaterialStateProperty.resolveWith(
                                  (states) => Size(100, 40)),
                              shape: MaterialStateProperty.resolveWith(
                                  (states) => RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      )),
                            ),
                            child: Text(
                              'InnBucks',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Stack(
                    children: [
                      Card(
                        elevation: 5,
                        child: Container(
                          width: 330,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              top: BorderSide(
                                color: Colors
                                    .red, // Set your desired border color here
                                width: 2.0, // Set your desired border width here
                              ),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 60),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                  'Account details',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 15),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Container(
                                  width: 300,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: '1234 ....  765723... 900',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 120,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: TextFormField(
                                        style: TextStyle(fontSize: 12),
                                        decoration: InputDecoration(
                                          hintText: 'Expiry Date',
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 120,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: TextFormField(
                                        style: TextStyle(fontSize: 12),
                                        decoration: InputDecoration(
                                          hintText: 'Last 4 digits on card',
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // SizedBox(height: 25),
                              // Padding(
                              //   padding: const EdgeInsets.symmetric(horizontal: 10),
                              //   child: Divider(
                              //     thickness: 2,
                              //     color: Colors.red,
                              //   ),
                              // ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Included in your booking',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                              ),
                              SizedBox(height: 10),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                          checkColor: Colors.greenAccent,
                                          activeColor: Colors.green.shade600,

                                          value: true, onChanged: (value) {}),
                                      Text(
                                        'Vehicle Value',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                          checkColor: Colors.greenAccent,
                                          activeColor: Colors.green.shade600,

                                          value: true, onChanged: (value) {}),
                                      Text(
                                        'Insurance',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                          checkColor: Colors.greenAccent,
                                          activeColor: Colors.green.shade600,

                                          value: true, onChanged: (value) {}),
                                      Text(
                                        'Car hire fee',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                          checkColor: Colors.greenAccent,
                                          activeColor: Colors.green.shade600,

                                          value: true, onChanged: (value) {}),
                                      Text(
                                        'Car wash fee',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Card(
                                elevation: 5,
                                margin: EdgeInsets.all(16),
                                shadowColor: Colors.grey.shade200,
                                color: Colors.grey.shade50,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                    color: Colors.red, // Red border color
                                    width: 2,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Total Amount To Be Paid',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            '\$320',
                                            style: TextStyle(
                                              fontSize: 24,
                                              color: Colors.red, // Red text color
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'Insurance included in the total amount',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey.shade400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                      checkColor: Colors.greenAccent,
                                      // activeColor: Colors.green.shade600,
                                      value: false,
                                      onChanged: (value) {}),

                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Do you agree to Terms and Conditions?'
                                  )
                                ],
                              ),
                              Center(
                                child: ElevatedButton(
                                    onPressed: (){
                                      showDialog(
                                          context: context,
                                          builder: (context) => FluidDialog(
                                            rootPage: FluidDialogPage(
                                              alignment: Alignment.center,
                                              builder: (context) => Padding(
                                                padding: const EdgeInsets.all(16.0),
                                                child: Container(
                                                  height: 320,
                                                  child: Column(
                                                    children: [
                                                      Image.asset('assets/img_2.png', height: 200, width: 200),
                                                      SizedBox(height: 20),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Your booking has been',
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                          SizedBox(width: 8),
                                                          Text(
                                                            'CONFIRMED',
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              color: Colors.red, // Red text color
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 20),
                                                      ElevatedButton(
                                                          onPressed: (){
                                                           Navigator.pop(context);
                                                          },
                                                          style: ButtonStyle(
                                                            backgroundColor: MaterialStateColor.resolveWith((states) => Colors.red),
                                                            minimumSize: MaterialStateProperty.resolveWith((states) => Size(160, 50)),
                                                            shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(5),
                                                            )
                                                            ),
                                                          ),
                                                          child: Text(
                                                            'Cancel Booking',
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 14
                                                            ),

                                                          )
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                      );
                                    },
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateColor.resolveWith((states) => Colors.red),
                                      minimumSize: MaterialStateProperty.resolveWith((states) => Size(160, 50)),
                                      shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      )
                                      ),
                                    ),
                                    child: Text(
                                      'Pay Now',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12
                                      ),

                                    )
                                ),
                              ),
                              SizedBox(height: 10,)
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          top: -55,
                          right: 0,
                          child: Image.asset(
                            'assets/img_2.png',
                            height: 120,
                            width: 120,
                          )),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
