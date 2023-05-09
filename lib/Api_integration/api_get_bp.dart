import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sktr/Api_modelClass/team_leader_modelclass.dart';

class ApiGetByBp {
  static GetApiGetByBp(context, String token, String? userType) async {
    List<Users> allGetByBplist = [];
    SharedPreferences sharedPreferences;
    Users allUsersBp;
    try {
      final FormData formData = FormData.fromMap({
        "userType": "${userType}",
      });
      var Response = await http.post(
        Uri.parse("http://apps.bigerp24.com/api/type_wise_user"),
        headers: {
          'Content-Type': 'application/json',
          "Authorization": " Bearer $token",
        },
        body: jsonEncode({"userType": userType.toString()}),
      );

      var data = jsonDecode(Response.body);
      print("ByBp daaataaaaaaaaaaa========>: ${data}");
      for (var i in data!["users"]) {
        allUsersBp = Users.fromJson(i);
        allGetByBplist.add(allUsersBp);
      }
      print("ByBp length====>: ${allGetByBplist.length}");
      print("ByBp Name=========>${allGetByBplist[0].name}");
      print("ByBp id=========>${allGetByBplist[0].id}");
    } catch (e) {
      print("Something is wrong all ByBp=======:$e");
    }
    return allGetByBplist;
  }
}