import 'package:dashkai/screens/login_screen.dart';
import 'package:flutter/material.dart';

class PickAccountScreen extends StatefulWidget {
  const PickAccountScreen({super.key});

  @override
  State<PickAccountScreen> createState() => _PickAccountScreenState();
}

class _PickAccountScreenState extends State<PickAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Image.asset(
                'assets/logo.png',
                width: 200,
                height: 100,
              ),
              Image.asset(
                'assets/car_one.png',
                width: 300,
                height: 200,
              ),
              const SizedBox(height: 20),
              const Text(
                'Select Account',
                style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 47, 74, 95),
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
              Text(
                'You have two accounts, please select one',
                style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 15,
                    fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                  onPressed: () {
                    //Navigator.push(
                    //context,
                    //MaterialPageRoute(builder: (context) => ()),
                    //);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.red.shade900),
                    minimumSize: MaterialStateProperty.resolveWith(
                        (states) => const Size(150, 50)),
                    shape: MaterialStateProperty.resolveWith(
                        (states) => RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )),
                  ),
                  child: const Text(
                    'Host',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )),
              const SizedBox(height: 15),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.red.shade900),
                    minimumSize: MaterialStateProperty.resolveWith(
                        (states) => const Size(150, 50)),
                    shape: MaterialStateProperty.resolveWith(
                        (states) => RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )),
                  ),
                  child: const Text(
                    'Driver',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
