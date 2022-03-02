import 'package:citizen_issue_solver_flutter/screens/issue_feed.dart';
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
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () async {
                    await clearStorage();
                    Navigator.pushReplacementNamed(context, Routes.root);
                  },
                  child: const Icon(
                    Icons.logout,
                    size: 26.0,
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.more_vert),
                )),
          ],
        ),

        drawer: MyDrawer(context: context),

        body: pages[_currentIndex],
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
      ),
    );
  }
}




