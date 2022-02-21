import 'dart:convert';

import 'package:citizen_issue_solver_flutter/main.dart';
import 'package:citizen_issue_solver_flutter/models/api_res.dart';
import 'package:citizen_issue_solver_flutter/models/shout.dart';
import 'package:citizen_issue_solver_flutter/networks/issue.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/routs.dart';
import '../local_storage/localops.dart';

class IssueFeed extends StatefulWidget {
  const IssueFeed({Key? key}) : super(key: key);

  @override
  _IssueFeedState createState() => _IssueFeedState();
}

class _IssueFeedState extends State<IssueFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Issue Feed'),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () async {
                  await clearStorage();

                  Navigator.pushReplacementNamed(context, Routes.loginWrapper);

                },
                child: const Icon(
                  Icons.logout,
                  size: 26.0,
                ),
              )
          ),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                    Icons.more_vert
                ),
              )
          ),
        ],
      ),
      body: IssueBody(),

    );
  }
}

class IssueBody extends StatefulWidget {
  const IssueBody({Key? key}) : super(key: key);

  @override
  _IssueBodyState createState() => _IssueBodyState();
}

class _IssueBodyState extends State<IssueBody> {

  List<Shout> shouts = [];


  @override
  void initState()  {

   getIssues().then((res) {
      print(res.body);

      ApiResponse apiResponse = ApiResponse.fromMap(jsonDecode(res.body)) ;

      setState(() {
        shouts=(apiResponse.data['shout'] as List).map((i) =>
            Shout.fromMap(i)).toList();
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
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(8) ,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              shouts[index].shoutTitle,
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            Text(shouts[index].shoutmessage ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: (){}, child: Text("Edit")),
                TextButton(onPressed: (){}, child: Text("delete")),

              ],
            )
          ],
        ),
      ),
    );
  }
}
