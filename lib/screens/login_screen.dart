import 'package:dashkai/screens/SignupOne_screen.dart';
import 'package:dashkai/screens/forgot_password_screen.dart';
import 'package:dashkai/services/auth_Services.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthenticationService signIn = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Column(children: [
        SizedBox(
          height: 26,
        ),
        Center(
          child: Image.asset(
            'assets/logo.png',
            width: 150,
            height: 150,
          ),
        ),
        SizedBox(
          height: 0,
        ),
        Center(
          child: Text(
            'Sign in to Dashkai',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 25),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Dont have an account?',
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
                  MaterialPageRoute(builder: (context) => SignupScreenOne()),
                );
              },
              child: Text(
                'SIGN UP',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            ),
            SizedBox(width: 5),
            Text(
              'here',
              style: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                  fontSize: 12),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: 200,
          color: Colors.grey.shade200,
          child: TextField(
            controller: signIn.emailController,
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
            controller: signIn.passwordController,
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
        Padding(
          padding: EdgeInsets.only(left: 100),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
              );
            },
            child: Text(
              "Forgot Password?",
              style: TextStyle(
                  color: Colors.red, fontStyle: FontStyle.italic, fontSize: 12),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              signIn.login(context);
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => Colors.red),
              minimumSize:
                  MaterialStateProperty.resolveWith((states) => Size(180, 40)),
              shape: MaterialStateProperty.resolveWith(
                  (states) => RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
            ),
            child: Text(
              'Next',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            )),
      ])),
    );
  }
}
