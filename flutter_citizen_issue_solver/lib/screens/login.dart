import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
      body: LoginBody(),
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
  final _addressController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text("Registration"),
          TextFormField(
            controller: _usernameController,
            decoration: const InputDecoration(
              labelText: "Username",
            ),
          ),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: "Password",
            ),
          ),
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
          TextFormField(
            controller: _addressController,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              // labelText: "Address",
            ),
          ),
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
              fetchResult(user).then((res) {
                print(res.body.toString());
                const snackBar = SnackBar(
                  content: Text('Sign up Successfull'),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              });
            },
            child: const Text('Register'),
          )
        ],
      ),
    );
  }

  Future<http.Response> fetchResult(User user) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
    };

    final response = await http.post(Uri.parse('http://localhost:8080/signup'),
        headers: requestHeaders, body: jsonEncode(user.toMap()));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return response;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
