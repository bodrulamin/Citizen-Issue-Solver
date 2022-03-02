import 'dart:convert';

import 'package:citizen_issue_solver_flutter/constant/routs.dart';
import 'package:citizen_issue_solver_flutter/local_storage/localops.dart';
import 'package:citizen_issue_solver_flutter/models/api_res.dart';
import 'package:citizen_issue_solver_flutter/models/user_payload.dart';
import 'package:citizen_issue_solver_flutter/networks/user_ops.dart';
import 'package:citizen_issue_solver_flutter/widgets/text_field.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SingleChildScrollView(child: LoginBody()),
      appBar: AppBar(
        title: const Text("Citizen Issue Solver"),
      ),
    );
  }
}

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {


  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/loginimage.jpg"),
        const Text(
          "Login",
          style: TextStyle(
              fontSize: 25,
              fontFamily: "RobotoMono",
              fontWeight: FontWeight.bold,
              color: Colors.blue),
        ),
        TextBox(controller: _usernameController, label: "Username"),
        TextBox(controller: _passwordController, label: "Password"),
        Column(
          children: [
            ElevatedButton(
              onPressed: () {
                UserPayload user = UserPayload(
                    username: _usernameController.text,
                    password: _passwordController.text,
                   );

                signIn(user).then((res) {
                  ApiResponse apires =
                      ApiResponse.fromMap(jsonDecode(res.body));

                  SnackBar snackBar = SnackBar(
                    content: Text(apires.msg),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  if (apires.status == 'success') {
                    User loggedInUser = User.fromMap(apires.data['user']);
                    saveToStorage(loggedInUser);
                    Navigator.pushReplacementNamed(context, Routes.home);
                  }
                });
              },
              child: const Text('Login'),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, Routes.registration);
                },
                child: const Text('New user? Sign Up here'))
          ],
        )
      ],
    );
  }


}
