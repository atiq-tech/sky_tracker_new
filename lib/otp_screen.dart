import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sktr/views/data_list_screen.dart';
import 'package:sktr/widget/button.dart';
import 'package:sktr/widget/gap_height.dart';

class OTPScreen extends StatefulWidget {
  OTPScreen(
      {super.key,
      required this.phoneNumber,
      required this.api_otp,
      required this.token});
  String? phoneNumber;
  String? api_otp;
  String? token;
  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController _OTPController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("phoneNumber============>${widget.api_otp}");
    print("phoneNumber============>${widget.phoneNumber}");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify Phone"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          gapHeight(height: 40.0),
          Center(
            child: Text(
              "OTP Sent to your number ${widget.phoneNumber},\nPlease verify using this 4 digit OTP!",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 124, 107, 46),
              ),
            ),
          ),
          gapHeight(height: 10.0),
          const Divider(color: Colors.transparent),
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 8.0, 19.0, 0.0),
            child: Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: Text("OTP Code"),
                ),
                Expanded(
                  flex: 7,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextFormField(
                      onChanged: (value) {
                        print(value);
                        if (widget.api_otp == value) {}
                      },
                      controller: _OTPController,
                      keyboardType: TextInputType.number,
                      // maxLength: 4,
                      decoration: const InputDecoration(
                        hintText: "Enter OTP",
                        hintStyle: TextStyle(color: Colors.black26),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          gapHeight(height: 10.0),
          const Divider(color: Colors.transparent),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 20,
              child: PurpleButton("Submit", () {
                otpvarification();
              }),
            ),
          ),
        ],
      ),
    );
  }

  otpvarification() async {
    try {
      Response response = await Dio().post(
          "http://apps.bigerp24.com/api/phone_verify?otpCode=${widget.api_otp}&code=${_OTPController.text}",
          options:
              Options(headers: {"Authorization": "Bearer ${widget.token}"}));
      print(response.data);
      Navigator.pop(context);
    } catch (e) {
      print(e);
    }
  }
}
























  // otpvarification() async {
  //   try {
  //     Response response = await Dio().post(
  //         "http://apps.bigerp24.com/api/phone_verify?otpCode=${widget.api_otp}&code=${_OTPController.text}",
  //         options: Options(headers: <String, String>{
  //           "Authorization": "Bearer ${widget.token}"
  //         }));
  //     var item = jsonDecode(response.data);
  //     print(item);
  //     if (item["message"] == "Data Successfully Verified") {
  //       Navigator.pushReplacement(
  //           context, MaterialPageRoute(builder: (context) => DataListScreen()));
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //           backgroundColor: Color.fromARGB(255, 7, 125, 180),
  //           duration: Duration(seconds: 1),
  //           content: Center(child: Text("Data Successfully Verified"))));
  //     }
  //     print(item["message"]);
  //   } catch (e) {
  //     print(e);
  //   }
  // }