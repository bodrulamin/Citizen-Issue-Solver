import 'dart:convert';

import 'package:citizen_issue_solver_flutter/models/api_res.dart';
import 'package:citizen_issue_solver_flutter/networks/user_ops.dart';
import 'package:citizen_issue_solver_flutter/widgets/text_field.dart';
import 'package:flutter/material.dart';

import '../constant/routs.dart';
import '../models/user.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SingleChildScrollView(child: RegistrationBody()),
      appBar: AppBar(
        title: const Text("Citizen Issue Solver"),
      ),
    );
  }
}

class RegistrationBody extends StatefulWidget {
  const RegistrationBody({Key? key}) : super(key: key);

  @override
  _RegistrationBodyState createState() => _RegistrationBodyState();
}

class _RegistrationBodyState extends State<RegistrationBody> {
  var usertypes = ["citizen", "provider"];

  var selectedUserType;

  final _usernameController = TextEditingController();
  final _addressController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var labelText2 = "Username";
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Image.asset("assets/images/registrationimage.jpg"),

          const Text(
            "Register Here",
            style: TextStyle(
                fontSize: 25,
                fontFamily: "RobotoMono",
                fontWeight: FontWeight.bold,
                color: Colors.blue),
          ),
          TextBox(controller: _usernameController, label: "Username"),
          TextBox(controller: _passwordController, label: "Password"),
          DropdownUsertype(),
          TextBox(controller: _addressController, label: "Address "),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  User user = User(
                      username: _usernameController.text,
                      password: _passwordController.text,
                      usertype: selectedUserType,
                      email: "bodrulamin@gmail.com",
                      fullname: _usernameController.text,
                      address: _addressController.text,
                      phone: '017554654');

                  print(user);
                  signUp(user).then((res) {
                    print(res.body);
                    ApiResponse apires =
                        ApiResponse.fromMap(jsonDecode(res.body));

                    SnackBar snackBar = SnackBar(
                      content: Text(apires.msg),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    if (apires.status == 'success') {
                      Navigator.pushReplacementNamed(context, Routes.home);
                    }
                  });
                },
                child: const Text('Register'),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.login);
                  },
                  child: Text('Already a user? Sign in here'))
            ],
          )
        ],
      ),
    );
  }

  Padding DropdownUsertype() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(border: OutlineInputBorder()),
        items: usertypes.map((String usertype) {
          return DropdownMenuItem<String>(
            value: usertype,
            child: Text(usertype),
          );
        }).toList(),
        onChanged: (newValue) {
          // do other stuff with _category
          setState(() => selectedUserType = newValue);
        },
        value: selectedUserType ?? usertypes[0],
      ),
    );
  }
}
