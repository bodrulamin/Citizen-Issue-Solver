import 'package:citizen_issue_solver_flutter/local_storage/sharedpref.dart';
import 'package:citizen_issue_solver_flutter/screens/issue_feed.dart';
import 'package:citizen_issue_solver_flutter/screens/login.dart';
import 'package:flutter/material.dart';

import 'models/user.dart';

void main() {
  runApp(const MaterialApp(
    home: LoginPage(),
  ));
}

class LoginWrapper extends StatefulWidget {
  const LoginWrapper({Key? key}) : super(key: key);

  @override
  _LoginWrapperState createState() => _LoginWrapperState();
}

class _LoginWrapperState extends State<LoginWrapper> {
  late Future<User> _user;

  @override
  void initState() {
    _user = LocalStorage.getLocalUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
        future: _user,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return IssueFeed();
              }
          }
        });
  }
}
