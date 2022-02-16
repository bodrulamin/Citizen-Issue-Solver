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
    );
  }
}
