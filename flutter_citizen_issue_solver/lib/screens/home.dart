import 'package:citizen_issue_solver_flutter/screens/issue_feed.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../constant/routs.dart';
import '../widgets/drawer.dart';

class HomePage extends StatefulWidget {
  static const title = 'Citizen Issue Solver';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;
  static const MaterialColor blue = MaterialColor(
    0xFF6777EF,
    <int, Color>{
      50: Color(0xFFE3F2FD),
      100: Color(0xFFBBC2F3),
      200: Color(0xFF98A3F1),
      300: Color(0xFF8793EA),
      400: Color(0xFF7683E7),
      500: Color(0xFF6777EF),
      600: Color(0xFF5A6BEA),
      700: Color(0xFF4859D5),
      800: Color(0xFF3D4DC5),
      900: Color(0xFF3242B6),
    },
  );

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const Dashboard(),
      const Issues(),
      const Search(),
      const Profile()
    ];
    return MaterialApp(
      title: HomePage.title,
      theme: ThemeData(
        primarySwatch: blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(HomePage.title),
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



class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Dashboard")
      ],
    );
  }
}

class Issues extends StatelessWidget {
  const Issues({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IssueBody();
  }
}

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text("Search")],
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text("Profile")],
    );
  }
}
