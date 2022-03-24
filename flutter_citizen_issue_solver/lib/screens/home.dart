import 'package:citizen_issue_solver_flutter/screens/issue_feed.dart';
import 'package:citizen_issue_solver_flutter/screens/post_issue.dart';
import 'package:citizen_issue_solver_flutter/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../constant/routs.dart';
import '../local_storage/localops.dart';
import '../theme/colors.dart';
import '../widgets/drawer.dart';
import 'dashboard.dart';

class HomePage extends StatefulWidget {
  static const title = 'Citizen Issue Solver';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const Dashboard(),
      const IssueBody(),
    const Profile(),
      const PostIssue(),

    ];
    return MaterialApp(
      title: HomePage.title,
      theme: ThemeData(
        primarySwatch: colorSwatch,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text(HomePage.title),
            actions: [
              if (_currentIndex == 1)
                PopupMenuButton<String>(
                  icon: Icon(Icons.filter_alt),
                  onSelected: handleFilter,
                  itemBuilder: (BuildContext context) {
                    return {'draft', 'started', 'completed'}.map((
                        String choice) {
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(choice),
                      );
                    }).toList();
                  },
                ),
              PopupMenuButton<String>(
                onSelected: handleClick,
                itemBuilder: (BuildContext context) {
                  return {'Logout', 'Settings'}.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
              ),
            ],
          ),
          drawer: MyDrawer(context: context),
          body: pages[_currentIndex],
          floatingActionButton:  (_currentIndex == 1) ? FloatingActionButton(
          child: Icon(Icons.add), onPressed: () {
            setState(() {
              _currentIndex = 3;
            });
          })
          : null
      ,
      bottomNavigationBar: Card(
        child: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [

            /// Home
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              selectedColor: Colors.purple,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: Icon(Icons.add_task),
              title: Text("Issues"),
              selectedColor: Colors.pink,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile"),
              selectedColor: Colors.teal,
            ),
          ],
        ),
      ),
    ),);
  }

  void handleClick(String value) {
    switch (value) {
      case 'Logout':
        break;
      case 'Settings':
        break;
    }
  }

  void handleFilter(String value) {}
}
