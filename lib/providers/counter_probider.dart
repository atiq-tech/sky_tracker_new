import 'package:flutter/cupertino.dart';
import 'package:sktr/Api_integration/api_get_area.dart';
import 'package:sktr/Api_integration/api_get_bp.dart';
import 'package:sktr/Api_integration/api_get_data.dart';
import 'package:sktr/Api_integration/api_get_leader.dart';
import 'package:sktr/Api_modelClass/all_get_area_model_class.dart';
import 'package:sktr/Api_modelClass/all_get_data_modelClass.dart';
import 'package:sktr/Api_modelClass/team_leader_modelclass.dart';

class CounterProvider extends ChangeNotifier {
  //get Area
  List<Areas> allGetAreaslist = [];
  getArea(BuildContext context, String token) async {
    allGetAreaslist = await ApiAllGetArea.GetApiAllGetArea(context, token);
    notifyListeners();
  }

  //get data
  List<DataLists> allGetDatalist = [];
 getGetData(context, String? dateFrom, String? dateTo, var areaId,var bpId, var leaderId) async {
    allGetDatalist =
        await ApiAllGetData.GetApiAllGetData(context, dateFrom, dateTo, areaId,bpId,leaderId);
    notifyListeners();
  }
   //get Team Leader api
  List<Users> allGetTeamLeaderlist = [];
  getTeamLeader(context, String token, String? userType) async {
    allGetTeamLeaderlist =
        await ApiTeamLeader.GetApiTeamLeader(context, token, userType);
    notifyListeners();
  }

  //get by bp api
  List<Users> allGetByBplist = [];
  getByBp(context, String token, String? userType) async {
    allGetByBplist = await ApiGetByBp.GetApiGetByBp(context, token, userType);
    notifyListeners();
  }
}
