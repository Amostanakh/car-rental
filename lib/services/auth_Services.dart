import 'package:dashkai/repositories/user_auth.dart';
import 'package:dashkai/screens/home_screen.dart';
import 'package:dashkai/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationService {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  GetStorage getStorage = GetStorage();
  Map<String, dynamic> data = {};
//Sign up code
  void signup(BuildContext context) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((signedUpUser) async {
      data = {
        "email": signedUpUser.user!.email,
        "uid": signedUpUser.user!.uid,
        // 'phonenumber': phoneNumberController.text,phoneNumberController.text
      };

      await getStorage.write("user", data);
      // ignore: use_build_context_synchronously
      UserManagement().storeNewUser(signedUpUser.user, context);
    }).catchError((e) {
      Fluttertoast.showToast(
          msg: "An Error occured, try again",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.black,
          fontSize: 16.0);
    });
  }

  //login code
  void login(context) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((signedInUser) async {
      data = {
        "email": signedInUser.user!.email,
        "uid": signedInUser.user!.uid,
      };
      await getStorage.write("user", data);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }).catchError((e) {
      Fluttertoast.showToast(
          msg: "Email does not exist, try to sign up",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.black,
          fontSize: 16.0);
    });
  }

  signOut(context) async {
    await FirebaseAuth.instance.signOut();
    getStorage.erase();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  Future forgotPassword({required String email}) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text);
      print("Success");
    } on FirebaseAuthException catch (err) {
      print("error occored");
      throw Exception(err.message.toString());
    } catch (err) {
      print('Error again boss');
      throw Exception(err.toString());
    }
  }

  // void forgetpassword(context) async {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   try {
  //     await auth.sendPasswordResetEmail(email: emailController.text);

  //     print(auth.sendPasswordResetEmail(email: emailController.text));

  //     // .then((value) =>

  //     //  Navigator.push(
  //     //       context,
  //     //       MaterialPageRoute(builder: (context) => const GetCode()

  //     //       ),
  //     //     ));

  //     print('forget password sure');
  //   } catch (e) {
  //     print('Email does dont exist');
  // Fluttertoast.showToast(
  //     msg: "Email does not exist",
  //     toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.CENTER,
  //     timeInSecForIosWeb: 1,
  //     backgroundColor: Colors.grey,
  //     textColor: Colors.black,
  //     fontSize: 16.0);
  //   }
  //   // Get.snackbar('Try Again', 'Email does not exist');  Email Successfully reseted', 'Open email to finish verication
  // }
}
