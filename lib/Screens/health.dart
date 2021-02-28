import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HealthPage extends StatefulWidget {
  @override
  _HealthPageState createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Available Self-Tests",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    fontSize: 30),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 300,
              child: ListView(
                children: [
                  Container(
                    // height: 80,
                    width: double.maxFinite,
                    child: Card(
                      color: Colors.pink.withOpacity(0.7),
                      elevation: 0,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Container(
                                child: Text(
                              "Mental Health!",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )),
                            IconButton(
                              icon: Icon(Icons.navigate_next),
                              onPressed: () {
                                Navigator.pushNamed(context, "/test");
                              },
                              iconSize: 20,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  Container(
                    // height: 80,
                    width: double.maxFinite,
                    child: Card(
                      color: Colors.pink.withOpacity(0.7),
                      elevation: 0,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Container(
                                child: Text(
                              "Test1",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )),
                            IconButton(
                              icon: Icon(Icons.navigate_next),
                              onPressed: () {},
                              iconSize: 20,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  Container(
                    // height: 80,
                    width: double.maxFinite,
                    child: Card(
                      color: Colors.pink.withOpacity(0.7),
                      elevation: 0,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Container(
                                child: Text(
                              "Test1",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )),
                            IconButton(
                              icon: Icon(Icons.navigate_next),
                              onPressed: () {},
                              iconSize: 20,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  Container(
                    // height: 80,
                    width: double.maxFinite,
                    child: Card(
                      color: Colors.pink.withOpacity(0.7),
                      elevation: 0,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Container(
                                child: Text(
                              "Test1",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )),
                            IconButton(
                              icon: Icon(Icons.navigate_next),
                              onPressed: () {},
                              iconSize: 20,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              alignment: Alignment.centerLeft,
              child: Text(
                "Announcements",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    fontSize: 30),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
