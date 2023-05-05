import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sktr/conts/app_colors.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        elevation: 10.0,
        centerTitle: true,
        title: Text(
          "My Profile",
          style: TextStyle(fontSize: 25.0, color: Colors.white),
        ),
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3,
              child: Center(
                  child: Text(
                "Muhammad Atiqur Rahman",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0),
              )),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color.fromARGB(255, 163, 59, 189),
                      Color.fromARGB(255, 110, 65, 182),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(160),
                      bottomRight: Radius.circular(160))),
            ),
          ),
          Positioned(
            top: 190.0,
            left: 130.0,
            right: 130.0,
            child: CircleAvatar(
              radius: 70,
              backgroundColor: Colors.blue,
              backgroundImage: NetworkImage(
                  "https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png"),
            ),
          ),
          Positioned(
              top: 400.0,
              left: 10.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.phone, size: 22.0),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "01700525823",
                        style: TextStyle(fontSize: 22.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(Icons.home, size: 25.0),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Muhammadpur-1207",
                        style: TextStyle(fontSize: 25.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(Icons.email, size: 25.0),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "iftikarislamatik1234@gmail.com",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
