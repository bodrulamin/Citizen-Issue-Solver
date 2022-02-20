import 'package:citizen_issue_solver_flutter/models/shout.dart';
import 'package:citizen_issue_solver_flutter/networks/issue.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  void initState() {

    getIssues().then((res) {
      print(res.body);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: List.generate(10, (index) {
        return Card(
          elevation: 10,
          child: Text("Hello"),
        );
      })
    );
  }
}
