import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sktr/Api_integration/api_client.dart';
import 'package:sktr/conts/app_colors.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});
  @override
  State<LogInPage> createState() => _LogInPageState();
}

Position? _currentPosition;

class _LogInPageState extends State<LogInPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // login method
  // Future<void> fetchlogin() async {
  //   String link = "http://apps.bigerp24.com/api/login";
  //   try {
  //     final formData = FormData.fromMap(
  //       {"username": "${_usernameController.text}", "password": "${_passwordController.text}"},
  //     );
  //     final response = await Dio().post(link, data: formData);
  //     print("All api dataaaaaaaa=====>>>$response");

  //     if (response.statusCode == 200) {
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => DeshBoardScreen(currentPosition: _currentPosition!),
  //         ),
  //       );
  //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration: Duration(seconds: 1), content: Text("Login successfull")));
  //     }
  //   } catch (e) {
  //     print("Something is wrong>>>>>>${e}");
  //   }
  // }

  //
  final box = GetStorage();
  getCurrentLocation() async {
    LocationPermission permission;
    bool serviceEnabled;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled) {
      Fluttertoast.showToast(
        msg: 'Please enable location services',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey[600],
        textColor: Colors.white,
      );
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(
          msg: 'Location permission denied',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey[600],
          textColor: Colors.white,
        );
      }
    }
    final Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    await box.write("lat", position.latitude);
    await box.write("lon", position.longitude);
    var lat = await box.read("lat");
    var lon = await box.read("lon");
    print("lat====>$lat");
    print("lon====>$lon");
    setState(() {
      _currentPosition = position;
    });

    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      print(placemarks);
    } catch (e) {
      print(e);
    }
  }

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: InkWell(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Container(
            color: AppColors.kPrimaryColor,
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 9,
                    ),
                    Container(
                      child: CircleAvatar(
                        radius: 45.0,
                        backgroundImage: NetworkImage(GetStorage()
                                    .read("token") ==
                                null
                            ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1Ef6Tfc-iINWf5MeZMwImrhKmY2gKbIQzDA&usqp=CAU"
                            : "https://thumbs.dreamstime.com/b/admin-sign-laptop-icon-stock-vector-166205404.jpg"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        child: const Text(
                      "Sky Tracker",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 25.0,
                          color: Colors.white),
                    )),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: 260.0,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 45.0),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                                color: const Color.fromARGB(255, 11, 7, 248),
                                width: 3.2)),
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (value) => value!.isEmpty
                                  ? 'user cannot be blank'
                                  : null,
                              controller: _usernameController,
                              decoration: const InputDecoration(
                                label: Text("User Name"),
                                hintText: "User Name",
                                errorStyle: TextStyle(fontSize: 0.0),
                                hintStyle: TextStyle(fontSize: 18.0),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color:
                                          Color.fromARGB(255, 155, 152, 152)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color:
                                          Color.fromARGB(255, 185, 185, 185)),
                                ),
                              ),
                              onTap: () async {},
                            ),
                            const SizedBox(height: 15.0),
                            TextFormField(
                              validator: (value) => value!.isEmpty
                                  ? 'Password cannot be blank'
                                  : null,
                              controller: _passwordController,
                              decoration: const InputDecoration(
                                suffixIcon: Icon(Icons.visibility_off),
                                suffixIconColor: Colors.grey,
                                errorStyle: TextStyle(fontSize: 0.0),
                                label: Text("Password"),
                                hintText: "Password",
                                hintStyle: TextStyle(fontSize: 18.0),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color:
                                          Color.fromARGB(255, 155, 152, 152)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color:
                                          Color.fromARGB(255, 185, 185, 185)),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15.0),
                            InkWell(
                              onTap: () async {
                                await getCurrentLocation();
                                if (_currentPosition != null) {
                                  // Fluttertoast.showToast(
                                  //   msg: 'Please get current location first',
                                  //   toastLength: Toast.LENGTH_SHORT,
                                  //   gravity: ToastGravity.BOTTOM,
                                  //   backgroundColor: Colors.grey[600],
                                  //   textColor: Colors.white,
                                  // );
                                }
                                if (_formkey.currentState!.validate()) {
                                  ApiClient.login(
                                      username: "${_usernameController.text}",
                                      password: "${_passwordController.text}",
                                      currentPosition: _currentPosition!,
                                      context: context);
                                  _usernameController.text = "";
                                  _passwordController.text = "";
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    duration: Duration(seconds: 1),
                                    content: Text("Fill all the field"),
                                  ));
                                }
                              },
                              child: Container(
                                height: 35.0,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 88, 204, 91),
                                      width: 2.0),
                                  color: const Color.fromARGB(255, 5, 114, 165),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: const Center(
                                    child: Text(
                                  "LOG IN",
                                  style: TextStyle(
                                      letterSpacing: 1.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                )),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}



// import 'dart:async';
// import 'dart:convert';
// import 'dart:math';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:sky_tracker/views/deshboard_screen.dart';

// class LogInPage extends StatefulWidget {
//   const LogInPage({super.key});
//   @override
//   State<LogInPage> createState() => _LogInPageState();
// }

// class _LogInPageState extends State<LogInPage> {
//   TextEditingController _usernameController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//   Fetchlogin() async {
//     String link = "http://apps.bigerp24.com/api/login";
//     try {
//       final formData = FormData.fromMap({
//         "username": "${_usernameController.text}",
//         "password": "${_passwordController.text}"
//       });
//       final response = await Dio().post(link, data: formData);
//       print("All api dataaaaaaaa=====>>>$response");

//       if (response.statusCode == 200) {
//         Navigator.pushReplacement(context,
//             MaterialPageRoute(builder: (context) => DeshBoardScreen()));
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             duration: Duration(seconds: 1),
//             content: Text("Login successfull")));
//       }
//     } catch (e) {
//       print("Something is wrong>>>>>>${e}");
//     }
//   }

//   final _formkey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: InkWell(
//           onTap: () {
//             FocusManager.instance.primaryFocus?.unfocus();
//           },
//           child: Container(
//             color: Color.fromARGB(255, 6, 126, 196),
//             height: double.infinity,
//             width: double.infinity,
//             child: SingleChildScrollView(
//               child: Form(
//                 key: _formkey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height / 9,
//                     ),
//                     Container(
//                       child: CircleAvatar(
//                         radius: 45.0,
//                         backgroundImage: NetworkImage(GetStorage()
//                                     .read("token") ==
//                                 null
//                             ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1Ef6Tfc-iINWf5MeZMwImrhKmY2gKbIQzDA&usqp=CAU"
//                             : "https://thumbs.dreamstime.com/b/admin-sign-laptop-icon-stock-vector-166205404.jpg"),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                         child: Text(
//                       "Sky Tracker",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w800,
//                           fontSize: 25.0,
//                           color: Colors.white),
//                     )),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                         height: 260.0,
//                         width: MediaQuery.of(context).size.width,
//                         padding:
//                             EdgeInsets.only(left: 20.0, right: 20.0, top: 45.0),
//                         decoration: BoxDecoration(
//                             color: Color.fromARGB(255, 255, 255, 255),
//                             borderRadius: BorderRadius.circular(15.0),
//                             border: Border.all(
//                                 color: Color.fromARGB(255, 11, 7, 248),
//                                 width: 3.2)),
//                         child: Column(
//                           children: [
//                             TextFormField(
//                               validator: (value) => value!.isEmpty
//                                   ? 'user cannot be blank'
//                                   : null,
//                               controller: _usernameController,
//                               decoration: InputDecoration(
//                                 label: Text("User Name"),
//                                 hintText: "User Name",
//                                 errorStyle: TextStyle(fontSize: 0.0),
//                                 hintStyle: TextStyle(fontSize: 18.0),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                       width: 1,
//                                       color:
//                                           Color.fromARGB(255, 155, 152, 152)),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                       width: 1,
//                                       color:
//                                           Color.fromARGB(255, 185, 185, 185)),
//                                 ),
//                               ),
//                               onTap: () async {},
//                             ),
//                             SizedBox(height: 15.0),
//                             TextFormField(
//                               validator: (value) => value!.isEmpty
//                                   ? 'Password cannot be blank'
//                                   : null,
//                               controller: _passwordController,
//                               decoration: InputDecoration(
//                                 suffixIcon: Icon(Icons.visibility_off),
//                                 suffixIconColor: Colors.grey,
//                                 errorStyle: TextStyle(fontSize: 0.0),
//                                 label: Text("Password"),
//                                 hintText: "Password",
//                                 hintStyle: TextStyle(fontSize: 18.0),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                       width: 1,
//                                       color:
//                                           Color.fromARGB(255, 155, 152, 152)),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                       width: 1,
//                                       color:
//                                           Color.fromARGB(255, 185, 185, 185)),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 15.0),
//                             InkWell(
//                               onTap: () {
//                                 if (_formkey.currentState!.validate()) {
//                                   Fetchlogin();
//                                   _usernameController.text = "";
//                                   _passwordController.text = "";
//                                 } else {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                       SnackBar(
//                                           duration: Duration(seconds: 1),
//                                           content: Text("Fill all the field")));
//                                 }
//                               },
//                               child: Container(
//                                 height: 35.0,
//                                 width: MediaQuery.of(context).size.width,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: Color.fromARGB(255, 88, 204, 91),
//                                       width: 2.0),
//                                   color: Color.fromARGB(255, 5, 114, 165),
//                                   borderRadius: BorderRadius.circular(10.0),
//                                 ),
//                                 child: Center(
//                                     child: Text(
//                                   "LOG IN",
//                                   style: TextStyle(
//                                       letterSpacing: 1.0,
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.w400),
//                                 )),
//                               ),
//                             ),
//                           ],
//                         )),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
