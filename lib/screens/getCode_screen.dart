import 'package:dashkai/screens/verificationComplete_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class GetCode extends StatefulWidget {
  const GetCode({super.key});

  @override
  State<GetCode> createState() => _GetCodeState();
}

class _GetCodeState extends State<GetCode> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
        body: Center(
          child: Column(
            children: [
              Image.asset(
                'assets/logo.png',
                width: 150,
                height: 150,

              ),
              Text(
                'Get Code',
                style: TextStyle(
                    fontWeight:FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 25

                ),
              ),
              Text(
                'We have sent a verification code to your email address.',
                style: TextStyle(
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                    fontSize: 12

                ),
              ),
              SizedBox(
                height: 25,
              ),
              OtpTextField(
                numberOfFields: 6,
                borderRadius: BorderRadius.circular(10.0),
                focusedBorderColor: Colors.red,
                showFieldAsBox: false,
                borderWidth: 45.0,
                onCodeChanged: (String code) {
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {

                },
              ),
              SizedBox(
                height: 45,
              ),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VerificationComplete()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith((states) => Colors.red),
                    minimumSize: MaterialStateProperty.resolveWith((states) => Size(130, 40)),
                    shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )
                  ),
                  ),
                  child: Text(
                    'Verify',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12
                    ),

                  )

              )],
          ),
        ),
      ),
    );
  }
}
