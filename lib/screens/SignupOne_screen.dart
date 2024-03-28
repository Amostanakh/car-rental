import 'package:dashkai/screens/login_screen.dart';
import 'package:dashkai/services/auth_Services.dart';
import 'package:flutter/material.dart';

import 'SignupTwo_screen.dart';

class SignupScreenOne extends StatefulWidget {
  const SignupScreenOne({super.key});

  @override
  State<SignupScreenOne> createState() => _SignupScreenOneState();
}

class _SignupScreenOneState extends State<SignupScreenOne> {
  AuthenticationService authuser = AuthenticationService();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/logo.png',
              width: 150,
              height: 150,
            ),
            Text(
              'Let\'s get started here',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 25),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                      fontSize: 12),
                ),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 200,
              color: Colors.grey.shade200,
              child: TextField(
                controller: authuser.emailController,
                style: TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
                decoration: InputDecoration(
                  labelText: 'Email',
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
                controller: authuser.passwordController,
                style: TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
                decoration: InputDecoration(
                  labelText: 'Password',
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
            // Container(
            //   width: 200,
            //   color: Colors.grey.shade200,
            //   child: TextField(
            //     controller: authuser.phoneNumberController,
            //     style: TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
            //     decoration: InputDecoration(
            //       labelText: 'Phone Number',
            //       border: OutlineInputBorder(
            //         borderSide: BorderSide.none,
            //         borderRadius: BorderRadius.circular(25),
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            // Container(
            //   width: 200,
            //   color: Colors.grey.shade200,
            //   child: TextField(
            //     style: TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
            //     decoration: InputDecoration(
            //       labelText: 'Date of Birth',
            //       border: OutlineInputBorder(
            //         borderSide: BorderSide.none,
            //         borderRadius: BorderRadius.circular(25),
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () {
                  authuser.signup(context);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.red),
                  minimumSize: MaterialStateProperty.resolveWith(
                      (states) => Size(180, 40)),
                  shape: MaterialStateProperty.resolveWith(
                      (states) => RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          )),
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                )),
          ],
        ),
      ),
    ));
  }
}
