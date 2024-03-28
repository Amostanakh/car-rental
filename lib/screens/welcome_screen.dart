import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:dashkai/screens/choose_host_driver.dart';
import 'package:dashkai/screens/login_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/logo.png",
                  width: 150,
                  height: 150,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Image
                    Image.asset(
                      'assets/car_one.png', // Replace with your image URL
                      width: 300,
                      height: 300,
                    ),
                    Positioned(
                      top: 35,
                      right: 110,
                      child: BubbleSpecialThree(
                        text: 'ESCAPE',
                        color: Colors.greenAccent.shade700,
                        tail: true,
                        textStyle: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ),
                    Positioned(
                      top: 80,
                      left: 5,
                      child: BubbleSpecialThree(
                        text: 'EXPLORE',
                        color: Colors.blue.shade700,
                        tail: true,
                        textStyle: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    Positioned(
                      top: 100,
                      right: 40,
                      child: BubbleSpecialThree(
                        text: 'FREEDOM',
                        color: Colors.amber,
                        tail: true,
                        textStyle: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                    Positioned(
                      bottom: 85,
                      right: 50,
                      child: BubbleSpecialThree(
                        text: 'DISCOVER',
                        color: Colors.deepPurple,
                        tail: true,
                        textStyle: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ),
                    Positioned(
                      bottom: 55,
                      left: 0,
                      child: BubbleSpecialThree(
                        text: 'THRILL',
                        color: Colors.grey.shade800,
                        tail: true,
                        textStyle: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.red),
                      minimumSize: MaterialStateProperty.resolveWith(
                          (states) => Size(180, 40)),
                    ),
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ))
              ]),
        ),
      ),
    );
  }
}
