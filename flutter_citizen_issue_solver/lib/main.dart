import 'package:citizen_issue_solver_flutter/constant/routs.dart';
import 'package:citizen_issue_solver_flutter/screens/dashboard.dart';
import 'package:citizen_issue_solver_flutter/screens/issue_feed.dart';
import 'package:citizen_issue_solver_flutter/screens/login.dart';
import 'package:citizen_issue_solver_flutter/screens/registration.dart';
import 'package:flutter/material.dart';

import 'local_storage/localops.dart';
import 'models/user.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: Routes.loginWrapper,
    routes: {
      Routes.loginWrapper: (context) => const LoginWrapper(),
      Routes.login: (context) => const LoginPage(),
      Routes.registration: (context) => const RegistrationPage(),
      Routes.dashboard: (context) =>  Dashboard( title:'Title'),
      Routes.shouts: (context) => const IssueFeed(),
    },
    debugShowCheckedModeBanner: false,
  ));
}

class LoginWrapper extends StatefulWidget {
  const LoginWrapper({Key? key}) : super(key: key);

  @override
  _LoginWrapperState createState() => _LoginWrapperState();
}

class _LoginWrapperState extends State<LoginWrapper> {
  User? user = User();

  @override
  void initState() {
    super.initState();
  }

  _clearStorage() async {
    await storage.clear();

    setState(() {
      user = storage.getItem('user') ?? "{}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: storage.ready,
      builder: (BuildContext context, snapshot) {
        if (snapshot.data == true) {
          String? userString = storage.getItem("user");

          if (userString == null) {
            //    user = User.fromMap(jsonDecode(userString!)) ;

            return const LoginPage();
          }

          return  Dashboard(title: 'Dashboard',);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
