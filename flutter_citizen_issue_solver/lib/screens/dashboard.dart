import 'dart:math' as math;

import 'package:citizen_issue_solver_flutter/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> counts = [536, 241, 21, 78, 96, 32];

    List<String> images = [
      "assets/images/shoutcount.png",
      "assets/images/pending.png",
      "assets/images/pending.png",
      "assets/images/pending.png",
      "assets/images/completed.png",
      "assets/images/completed.png",
    ];
    List<String> titles = [
      "Issues",
      "Pending ",
      "Processing ",
      "Canceled",
      "Completed",
      "Aborted"
    ];
    return Stack(
      children: <Widget>[
        dashBg,
        Container(
          margin: EdgeInsets.all(32),
          color: Colors.transparent,
          child: Center(
            child: GridView.count(
              scrollDirection: Axis.vertical,
            crossAxisCount: MediaQuery.of(context).size.width>600?3:2,
              children: [
                for (int i = 0; i < counts.length; i++)
                  DashCard(
                      count: counts[i], image: images[i], title: titles[i]),
              ],
            ),
          ),
        )
      ],
    );
  }

  get dashBg => Column(
        children: <Widget>[
          Expanded(
            child: ClipPath(
              clipper: OvalBottomBorderClipper(),
              child: Container(
                height: 100,
                color: colorSwatch.shade500,
              ),
            ),
            flex: 2,
          ),
          Expanded(
            child: Container(color: Colors.transparent),
            flex: 5,
          ),
        ],
      );
}

class DashCard extends StatelessWidget {
  const DashCard({
    Key? key,
    required this.count,
    required this.image,
    required this.title,
  }) : super(key: key);

  final int count;
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          ClipPath(
            clipper: MyDiagonalPathClipper(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    color: colorSwatch.shade100,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Transform.rotate(
                            angle: -math.pi / 4,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(count.toString(),
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(color: Colors.transparent),
                          flex: 5,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(color: Colors.transparent),
                  flex: 5,
                )
              ],
            ),
          ),
          Center(
            child: AspectRatio(
                aspectRatio: 1 / 3,
                child: Image.asset(
                  image,
                )),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FittedBox(
                  fit: BoxFit.fill,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      title,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyDiagonalPathClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.0, size.height / 2) // bam, nich
      ..lineTo(size.width / 2, 0)
      ..lineTo(size.width, 0.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
