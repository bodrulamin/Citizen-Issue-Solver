import 'dart:convert';

import 'package:citizen_issue_solver_flutter/constant/apiconfig.dart';
import 'package:citizen_issue_solver_flutter/models/shout.dart';
import 'package:http/http.dart' as http;

Map<String, String> requestHeaders = {
  'Content-type': 'application/json',
};

Future<http.Response> getIssues() async {
  final response =
      await http.get(Uri.parse(shoutGetAllApi), headers: requestHeaders);

  return response;
}
Future<http.Response> deleteIssue(Shout shout) async {
  final response =
      await http.post(Uri.parse(shoutDeleteApi), body: jsonEncode(shout.toMap()),  headers: requestHeaders);

  return response;
}
