import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sktr/Api_modelClass/team_leader_modelclass.dart';

class ApiTeamLeader {
  static GetApiTeamLeader(context, String token, String? userType) async {
    List<Users> allGetTeamLeaderlist = [];
    SharedPreferences sharedPreferences;
    Users allUsers;
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
      print("TeamLeader daaataaaaaaaaaaa========>: ${data}");
      for (var i in data!["users"]) {
        allUsers = Users.fromJson(i);
        allGetTeamLeaderlist.add(allUsers);
      }
      print("TeamLeader length====>: ${allGetTeamLeaderlist.length}");
      print("TeamLeader Name=========>${allGetTeamLeaderlist[0].name}");
      print("TeamLeader id=========>${allGetTeamLeaderlist[0].id}");
    } catch (e) {
      print("Something is wrong all Get TeamLeader=======:$e");
    }
    return allGetTeamLeaderlist;
  }
}