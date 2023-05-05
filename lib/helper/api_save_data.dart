// import 'dart:convert';

// import 'package:dio/dio.dart';

// class ApiAllAddsave {
//   static GetApiAllAddsave(
//     context,
//     String? app_experience,
//     String? app_install,
//     String? area_id,
//     String? event,
//     String? experience,
//     String? future,
//     String? gaming,
//     String? recharge_package,
//     String? recharge_amount,
//     String? gift,
//     String? gift_name,
//     String? area_id,
//     String? location,
//     String? program,
//     String? experience,
//     String? app_experience,
//     String? gaming,
//     String? event,
//     String? service,
//     String? future,
//   ) async {
//     String Link = "http://apps.bigerp24.com/api/save_data";

//     try {
//       Response response = await Dio().post(Link,
//           data: {
//             "app_experience": "Neither happy or unhappy",
//             "app_install": "yes",
//             "area_id": 1,
//             "event": "",
//             "experience": "",
//             "future": "",
//             "gaming": "Very unhappy",
//             "gift": "no",
//             "gift_name": "",
//             "id": "",
//             "location": "",
//             "mobile": "01700525823",
//             "name": "Ashik",
//             "new_sim": "no",
//             "program": "Very unhappy",
//             "recharge_amount": "",
//             "recharge_package": "no",
//             "sell_gb": "",
//             "sell_package": "yes",
//             "service": "",
//             "toffee": "no"
//           },
//           options: Options(headers: {
//             "Content-Type": "application/json",
//             "Authorization": "Bearer",
//           }));
//       print("Save data=======>:${response.data}");

//       var data = jsonDecode(response.data);

//       print("Add save length is ${data}");
//     } catch (e) {
//       print("Something is wrong add save data =======:$e");
//     }
//   }
// }
