import 'package:flutter/material.dart';

class SignupScreenFour extends StatefulWidget {
  const SignupScreenFour({super.key});

  @override
  State<SignupScreenFour> createState() => _SignupScreenFourState();
}

class _SignupScreenFourState extends State<SignupScreenFour> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Image.asset(
                  'assets/logo.png',
                  width: 250,
                  height: 100,

                ),
                Image.asset(
                  'assets/car_three.png',
                  width: 300,
                  height: 120,

                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Finally',
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
                  height: 40,
                ),
                Container(
                  width: 200,
                  child: TextField(
                    style: TextStyle(
                        fontSize: 10,
                        fontStyle: FontStyle.italic,

                    ),
                    decoration: InputDecoration(
                      labelText: 'Enter password',

                      // border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    onPressed: (){

                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith((states) => Colors.red),
                      minimumSize: MaterialStateProperty.resolveWith((states) => Size(180, 40)),

                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12
                      ),

                    )
                )
              ],

            ),
          ),
        )
    );
  }
}
