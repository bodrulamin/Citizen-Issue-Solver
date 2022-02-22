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
  var usertypes = ["citizen", "provider"];

  var selectedUserType;

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text("Login"),
          TextBox(controller: _usernameController, label: "Username"),
          TextBox(controller: _passwordController, label: "Password"),
          const Text("Select UserType"),
          DropdownButtonFormField(
            items: usertypes.map((String usertype) {
              return DropdownMenuItem(
                value: usertype,
                child: Text(usertype),
              );
            }).toList(),
            onChanged: (newValue) {
              // do other stuff with _category
              setState(() => selectedUserType = newValue);
            },
            value: selectedUserType,
          ),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  UserPayload user = UserPayload(
                      username: _usernameController.text,
                      password: _passwordController.text,
                      usertype: selectedUserType);

                  signIn(user).then((res) {
                    ApiResponse apires =
                        ApiResponse.fromMap(jsonDecode(res.body));

                    User loggedInUser = User.fromMap(apires.data['user']);

                    SnackBar snackBar = SnackBar(
                      content: Text(apires.msg),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    if (apires.status == 'success') {
                      saveToStorage(loggedInUser);
                     Navigator.pushReplacementNamed(context, Routes.shouts);

                    }
                  });
                },
                child: const Text('Login'),
              ),

              TextButton(
                  onPressed: () {

Navigator.pushReplacementNamed(context, Routes.registration);

                  },
                  child: Text('New user? Sign Up here'))
            ],
          )
        ],
      ),
    );
  }
}
