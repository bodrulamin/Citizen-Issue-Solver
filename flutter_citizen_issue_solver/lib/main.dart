import 'package:citizen_issue_solver_flutter/constant/routs.dart';
import 'package:citizen_issue_solver_flutter/screens/home.dart';
import 'package:citizen_issue_solver_flutter/screens/login.dart';
import 'package:citizen_issue_solver_flutter/screens/mmm.dart';
import 'package:citizen_issue_solver_flutter/screens/registration.dart';
import 'package:citizen_issue_solver_flutter/theme/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'local_storage/localops.dart';
import 'models/user.dart';

void main() {
  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }
  runApp(MaterialApp(
    initialRoute: Routes.home,
    routes: {
      Routes.root: (context) =>  LoginWrapper(),
      Routes.login: (context) =>  LoginPage(),
      Routes.registration: (context) =>  RegistrationPage(),
      Routes.home: (context) => HomePage(),
      Routes.mapsample: (context) => MapBuildingView(),
    },
    theme: ThemeData(
      primarySwatch: colorSwatch,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
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

          return HomePage();
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
