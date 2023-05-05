import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenProvider with ChangeNotifier {
  String token = '';

  Future<void> getSignUpToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token') ?? "";
    notifyListeners();
    print('my signupTokendata is: $token');
  }
}
