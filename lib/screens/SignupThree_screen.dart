import 'package:dashkai/screens/SignupFour_screen.dart';
import 'package:flutter/material.dart';

class SignupScreenThree extends StatefulWidget {
  const SignupScreenThree({super.key});

  @override
  State<SignupScreenThree> createState() => _SignupScreenThreeState();
}

class _SignupScreenThreeState extends State<SignupScreenThree> {
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
                'assets/car_two.png',
                width: 400,
                height: 120,

              ),
              SizedBox(
                height: 20,
              ),
              Text(
                  'Almost there',
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
                    fontStyle: FontStyle.italic
                  ),
                  decoration: InputDecoration(
                    labelText: 'Enter phone number',

                    // border: OutlineInputBorder(),
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
                      MaterialPageRoute(builder: (context) => SignupScreenFour()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith((states) => Colors.red),
                    minimumSize: MaterialStateProperty.resolveWith((states) => Size(180, 40)),

                  ),
                  child: Text(
                    'Get One Time Password',
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
