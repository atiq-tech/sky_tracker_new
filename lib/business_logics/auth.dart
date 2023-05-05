// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:sky_trecker/views/deshboard_screen.dart';

// class Auth {
//   static Future signUp(String emailAddress, String password, context) async {
//     try {
//       UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: emailAddress.toString(),
//         password: password.toString(),
//       );
//       var authCredential = userCredential.user;
//       if (authCredential!.uid.isNotEmpty) {
//         Fluttertoast.showToast(msg: "SignUp Successful");
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => const DeshBoardScreen()),
//         );
//       } else {
//         Fluttertoast.showToast(msg: "SignUp Failed");
//       }
//     } on FirebaseAuthException catch (exception) {
//       if (exception.code == "weak-password") {
//         print("The password provided is too weak.");
//         Fluttertoast.showToast(msg: "The password provided is too weak.");
//       } else if (exception.code == 'email-already-in-use') {
//         print("The account already exists for that email.");
//         Fluttertoast.showToast(msg: "The account already exists for that email.");
//       }
//     } catch (e) {
//       print("error is firebase Auth : $e");
//       Fluttertoast.showToast(msg: "error is firebase Auth : $e");
//     }
//   }

//   /////////////// Sign in / Login //////////////////
//   ///
//   static Future login(String emailAddress, String password, context) async {
//     try {
//       final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: emailAddress.toString(),
//         password: password.toString(),
//       );
//       var authCredential = userCredential.user;
//       if (authCredential!.uid.isNotEmpty) {
//         Fluttertoast.showToast(msg: "Login Successful");
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => const DeshBoardScreen()),
//         );
//       } else {
//         Fluttertoast.showToast(msg: "Login Failed");
//       }
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         Fluttertoast.showToast(msg: "No user found for that email.");
//         print('No user found for that email.');
//       } else if (e.code == 'wrong-password') {
//         print('Wrong password provided for that user.');
//         Fluttertoast.showToast(msg: "Wrong password provided for that user.");
//       }
//     }
//   }

//   static resetPassword(String email, BuildContext context) async {
//     try {
//       await FirebaseAuth.instance.sendPasswordResetEmail(email: email.toString());
//     } catch (e) {
//       Fluttertoast.showToast(msg: e.toString());
//     }
//   }
// }
