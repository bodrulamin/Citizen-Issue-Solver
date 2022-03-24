import 'dart:convert';

import 'package:citizen_issue_solver_flutter/constant/apiconfig.dart';
import 'package:citizen_issue_solver_flutter/models/api_res.dart';
import 'package:citizen_issue_solver_flutter/models/shout.dart';
import 'package:citizen_issue_solver_flutter/networks/issue.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../constant/routs.dart';
import '../local_storage/localops.dart';



class IssueBody extends StatefulWidget {
  const IssueBody({Key? key}) : super(key: key);

  @override
  _IssueBodyState createState() => _IssueBodyState();
}

class _IssueBodyState extends State<IssueBody> {
  List<Shout> shouts = [];

  @override
  void initState() {
    getIssues().then((res) {
      print(res.body);

      ApiResponse apiResponse = ApiResponse.fromMap(jsonDecode(res.body));

      setState(() {
        shouts = (apiResponse.data['shout'] as List)
            .map((i) => Shout.fromMap(i))
            .toList();
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: itemBuilder,
      itemCount: shouts.length,
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    return Column(
      children: [
        Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            children: [
              Image.network(
                shouts[index].photo.replaceAll('http://localhost:8080', host),
                fit: BoxFit.fill,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  shouts[index].shoutTitle,
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(shouts[index].shoutmessage),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () {}, child: Text("Edit")),
                  TextButton(onPressed: () {
                    deleteIssue(shouts[index]).then((value) {
                      setState(() {

                      });
                    });

                  }, child: Text("delete")),
                ],
              )
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: EdgeInsets.all(10),
        ),
        
      ],
    );
  }
}
