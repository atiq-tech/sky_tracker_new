import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sktr/conts/app_colors.dart';
import 'package:sktr/views/auth/login_page.dart';
import 'package:sktr/views/entry_screen.dart';
import 'package:sktr/widget/my_profile.dart';
import '../widget/deshboard.dart';
import 'data_list_screen.dart';

class DeshBoardScreen extends StatefulWidget {
  const DeshBoardScreen(
      {required this.currentPosition, required this.token, super.key});
  final Position currentPosition;
  final String token;

  @override
  State<DeshBoardScreen> createState() => _DeshBoardScreenState();
}

class _DeshBoardScreenState extends State<DeshBoardScreen> {
  String? _currentAddress;

  Future _logOut(context) async {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            insetPadding: EdgeInsets.zero,
            title: const Text("Are you sure to logout?"),
            content: SizedBox(
              // height:100,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.kPrimaryColor,
                      //shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text("No"),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LogInPage(),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.kPrimaryColor,
                      // shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text("Yes"),
                  ),
                ],
              ),
            ),
          );
        });
  }

  // Future<void> _getCurrentAddress() async {
  //   final List<Placemark> placemarks = await placemarkFromCoordinates(
  //     widget.currentPosition.latitude,
  //     widget.currentPosition.longitude,
  //   );
  //   // setState(() {
  //   //   _currentAddress =
  //   //       "${placemarks.first.subLocality!},${placemarks.first.thoroughfare!}, ${placemarks.first.locality!}";
  //   // });
  // }

  // @override
  // void initState() {
  //   _getCurrentAddress();
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SKY  TRACKER"),
        centerTitle: true,
        backgroundColor: AppColors.kPrimaryColor,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/Banglalink-Logo.jpg"),
                  fit: BoxFit.fill,
                ),
                // color: AppColors.kPrimaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfjno7hGrNNuPZwaFZ8U8Mhr_Yq39rzd_p0YN_HVYk6KFmMETjtgd9bwl0UhU6g4xDDGg&usqp=CAU"),
                    radius: 37,
                  ),
                  Text(
                    "Admin",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  Icon(Icons.expand_circle_down, color: Colors.white),
                ],
              ),
            ),
            ListTile(
              //leading: const Icon(Icons.person_outline_rounded),
              title: const Text(
                'Profile',
                style: TextStyle(color: AppColors.kPrimaryColor),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              // leading: const Icon(Icons.logout),
              title: const Text(
                'Sign out',
                style: TextStyle(color: AppColors.kPrimaryColor),
              ),
              onTap: () {
                _logOut(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 80.0,
              color: AppColors.kPrimaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //crossAxisAlignment: CrossAxisAlignment.baseline,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 68.0),
                    child: Text(
                      'Welcome, Admin',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfjno7hGrNNuPZwaFZ8U8Mhr_Yq39rzd_p0YN_HVYk6KFmMETjtgd9bwl0UhU6g4xDDGg&usqp=CAU"),
                    radius: 25,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Dashboard :",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 4 / 4),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return DeshBoard(
                      title: index == 0
                          ? "Data Entry"
                          : index == 1
                              ? "Data List"
                              : index == 2
                                  ? "My Profile"
                                  : "Log Out",
                      icon: index == 0
                         ? Icons.receipt_long_outlined
                          : index == 1
                              ? Icons.list_alt_outlined
                              : index == 2
                                  ? Icons.person
                                  : index == 3
                                      ? Icons.login
                                      : Icons.person,
                      onTap: () {
                        if (index == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) {
                              return DataEntryScreen(
                                currentPositionUser: widget.currentPosition,
                                token: widget.token,
                              );
                            }),
                          );
                        }
                        if (index == 1) {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (_) => DataListScreen(),
                            ),
                          );
                        }
                        if (index == 2) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => MyProfile()),
                          );
                        }
                        if (index == 3) {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (_) => LogInPage(),
                            ),
                          );
                        }
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (_) {
                        //     return DataEntryScreen(
                        //       currentPositionUser: widget.currentPosition,
                        //       token: widget.token,
                        //     );
                        //   }),
                        // );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
















// import 'package:flutter/material.dart';
// import 'package:sky_tracker/views/data_list_screen.dart';
// import 'package:sky_tracker/views/entry_screen.dart';

// class DeshBoardScreen extends StatelessWidget {
//   const DeshBoardScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: PreferredSize(
//           preferredSize: Size.fromHeight(120.0),
//           child: AppBar(
//             backgroundColor: Color.fromARGB(255, 125, 122, 255),
//             automaticallyImplyLeading: false,
//             title: const Text(
//               "Desh Board",
//             ),
//             centerTitle: true,
//             elevation: 0,
//             bottom: TabBar(
//               indicatorColor: Colors.black,
//               physics: const ClampingScrollPhysics(),
//               padding: const EdgeInsets.only(
//                   top: 10, left: 10, right: 10, bottom: 15),
//               unselectedLabelColor: Colors.white,
//               indicatorSize: TabBarIndicatorSize.label,
//               indicator: BoxDecoration(
//                 borderRadius: BorderRadius.circular(30),
//                 color: Colors.teal,
//               ),
//               tabs: [
//                 Tab(
//                   child: Container(
//                     height: 50,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(30),
//                       border: Border.all(color: Colors.white, width: 1),
//                     ),
//                     child: const Align(
//                       alignment: Alignment.center,
//                       child: Text("Entry"),
//                     ),
//                   ),
//                 ),
//                 Tab(
//                   child: Container(
//                     height: 50,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(30),
//                       border: Border.all(color: Colors.white, width: 1),
//                     ),
//                     child: const Align(
//                       alignment: Alignment.center,
//                       child: Text("Data List"),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             EntryScreen(),
//             DataListScreen(),
//           ],
//         ),
//       ),
//     );
//   }
// }
