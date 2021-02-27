import 'package:Stratos/Screens/page1.dart';
import 'package:Stratos/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class ExerciseScreen extends StatelessWidget {
  Widget listChild(int index, BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(blurRadius: 3, spreadRadius: 1, offset: Offset(2, 1)),
      ]),
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      height: 300,
      width: 300,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PushedPageA(),
              ));
        },
        child: Image.asset(
          "lib/assets/$index.gif",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Text(
              "AI Fitness Hub",
              style: GoogleFonts.poppins(
                  fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Text(
              "Get fit and master your body alignment",
              style: GoogleFonts.poppins(fontSize: 16),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
            height: 300,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                listChild(1, context),
                listChild(2, context),
                listChild(3, context),
                listChild(4, context),
                listChild(1, context),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
