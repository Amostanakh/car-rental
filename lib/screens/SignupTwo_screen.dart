import 'package:dashkai/screens/SignupFour_screen.dart';
import 'package:dashkai/screens/SignupThree_screen.dart';
import 'package:flutter/material.dart';

import 'SignupOne_screen.dart';

class SignupScreenTwo extends StatefulWidget {
  const SignupScreenTwo({super.key});

  @override
  State<SignupScreenTwo> createState() => _SignupScreenTwoState();
}

class _SignupScreenTwoState extends State<SignupScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.red,
                )),

            elevation: 0,
          ),
          body:
          Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 150,

                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                      'One more step',
                  style: TextStyle(
                      fontWeight:FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 25

                  ),
                ),
                Text(
                  'Sign up by filling the form to continue',
                  style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                      fontSize: 12

                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 200,
                  color: Colors.grey.shade200,
                  child: TextField(
                    style: TextStyle(
                        fontSize: 10,
                        fontStyle: FontStyle.italic
                    ),
                    decoration: InputDecoration(
                      labelText: 'Vehicle Type',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 200,
                  color: Colors.grey.shade200,
                  child: TextField(
                    style: TextStyle(
                        fontSize: 10,
                        fontStyle: FontStyle.italic
                    ),
                    decoration: InputDecoration(
                      labelText: 'Chasis No',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 200,
                  color: Colors.grey.shade200,
                  child: TextField(
                    style: TextStyle(
                        fontSize: 10,
                        fontStyle: FontStyle.italic
                    ),
                    decoration: InputDecoration(
                      labelText: 'Engine No',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 200,
                  color: Colors.grey.shade200,
                  child: TextField(
                    style: TextStyle(
                        fontSize: 10,
                        fontStyle: FontStyle.italic
                    ),
                    decoration: InputDecoration(
                      labelText: 'Registration No',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreenThree()),
                      );
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
                      'Next',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12
                      ),

                    )
                ),
              ],

            ),
          ),
        )
    );
  }
}

