import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sktr/Api_modelClass/all_get_area_model_class.dart';

class ApiAllGetArea {
  static GetApiAllGetArea(context, token) async {
    List<Areas> allGetAreaslist = [];
    SharedPreferences sharedPreferences;
    Areas allareas;
    try {
      var Response = await http
          .get(Uri.parse("http://apps.bigerp24.com/api/get_area"), headers: {
        'Content-Type': 'application/json',
        "Authorization": " Bearer $token",
      });

      var data = jsonDecode(Response.body);
      print("AAAAAAAArrrreaaaaa===>: ${data}");
      for (var i in data!["areas"]) {
        allareas = Areas.fromJson(i);
        allGetAreaslist.add(allareas);
      }
      print("Get Area length====>: ${allGetAreaslist.length}");
      print("Area Name=========>${allGetAreaslist[0].name}");
      print("Area id=========>${allGetAreaslist[0].id}");
    } catch (e) {
      print("Something is wrong all Get Area=======:$e");
    }
    return allGetAreaslist;
  }
}
