import 'package:flutter/material.dart';

import 'login_screen.dart';


class VerificationComplete extends StatefulWidget {
  const VerificationComplete({super.key});

  @override
  State<VerificationComplete> createState() => _VerificationCompleteState();
}

class _VerificationCompleteState extends State<VerificationComplete> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 140),
              CircleAvatar(
                backgroundColor: Colors.red,
                radius: 70,
                child: Center(
                  child: Icon(
                      Icons.check,
                    size: 90,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 35),
              Text(
                'Great!',
                style: TextStyle(
                    fontWeight:FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 25

                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(45.0, 0, 20, 0),
                child: Text(
                  'Don\'t worry we will let you know if something happens to your account',
                  style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                      fontSize: 12

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
                      MaterialPageRoute(builder: (context) => LoginScreen()),
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
                    'Back to Sign In',
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
      ),
    );
  }
}
