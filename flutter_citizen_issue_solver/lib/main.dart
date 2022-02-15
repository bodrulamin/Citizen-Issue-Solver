import 'package:citizen_issue_solver_flutter/models/user.dart';
import 'package:citizen_issue_solver_flutter/screens/registration.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MaterialApp(
    home: LoginWrapper(),
  ));
}

class LoginWrapper extends StatefulWidget {
  const LoginWrapper({Key? key}) : super(key: key);

  @override
  _LoginWrapperState createState() => _LoginWrapperState();
}

class _LoginWrapperState extends State<LoginWrapper> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<String> _user;

  @override
  void initState() {

    _prefs.then((value) => value.setString('user', 'this is user'));
    
    super.initState();

    _user = _prefs.then((SharedPreferences prefs) {
      return prefs.getString('user') ?? '';
    });
  }
  @override
  Widget build(BuildContext context) {

    return FutureBuilder<String>(
        future: _user,
        builder:(context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Text(
                  'data loaded ' + snapshot.data.toString());

              }
          }
        }
    );
  }
}
