import 'dart:convert';
import 'package:citizen_issue_solver_flutter/constant/apiconfig.dart';
import 'package:citizen_issue_solver_flutter/models/user.dart';
import 'package:citizen_issue_solver_flutter/models/user_payload.dart';
import 'package:http/http.dart' as http;

Map<String, String> requestHeaders = {
  'Content-type': 'application/json',
};

Future<http.Response> signUp(User user) async {
  final response = await http.post(Uri.parse(signupApi),
      headers: requestHeaders, body: jsonEncode(user.toMap()));

    return response;

}

Future<http.Response> signIn(UserPayload user) async {
  final response = await http.post(Uri.parse(signinApi),
      headers: requestHeaders, body: jsonEncode(user.toMap()));

    return response;

}
