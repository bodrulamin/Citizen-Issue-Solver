import 'dart:convert';

import 'package:citizen_issue_solver_flutter/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
   static final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void saveLocalUser(User user) {
    _prefs.then((value) => value.setString('user', jsonEncode(user)));
  }


 static User getLocalUser() {
    String userPref = _prefs.then((value) => value.getString('user')) as String;
    return jsonDecode(userPref);
  }
}