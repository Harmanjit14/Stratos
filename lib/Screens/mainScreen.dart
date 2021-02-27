import 'package:Stratos/Models/user.dart';
import 'package:Stratos/Screens/exerciseScreen.dart';
import 'package:Stratos/Screens/fitness.dart';
import 'package:Stratos/Screens/page1.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:table_calendar/table_calendar.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  CalendarController _calendarController;
  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  String pString = "";
  Color activeColorP = Colors.black;
  String selcPeriod = "Period's are'nt Expected!";

  Color activeColor = Colors.green;
  String selcExercise = "You were Active this Day!";
  Widget genderChild() {
    // pString = "Start Tracking";
    if (female == true) {
      return Container(
        margin: EdgeInsets.fromLTRB(20, 15, 0, 15),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Period Tracker!",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                ),
                Container(
                  child: Text(
                    "click the button to start tracker",
                    style:
                        GoogleFonts.poppins(textStyle: TextStyle(fontSize: 16)),
                  ),
                ),
                Container(
                  width: 200,
                  alignment: Alignment.center,
                  child: OutlineButton(
                    splashColor: Colors.pink,
                    highlightedBorderColor: Colors.pink[700],
                    borderSide: BorderSide(color: Colors.pink[700], width: 2),
                    onPressed: () {
                      Alert(
                        context: context,
                        type: AlertType.info,
                        title: "Add to my Calendar",
                        desc:
                            "Use this feature when you are on your periods so that it can track them more efficiently ",
                        buttons: [
                          DialogButton(
                            highlightColor: Colors.deepPurple,
                            child: Text(
                              "Add",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () async {
                              // await addPeriodInfo();
                              // await getPeriodInfo();
                              pString = "Done!";
                              setState(() {});
                              Navigator.pop(context);
                            },
                            color: Colors.pink,
                          ),
                        ],
                      ).show();
                    },
                    child: Text(
                      "Add",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.pink[700],
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                  alignment: Alignment.centerRight,
                  height: 150,
                  child: Image.asset(
                    "lib/assets/period.gif",
                    fit: BoxFit.fill,
                  )),
            ),
          ],
        ),
      );
    } else
      return SizedBox(
        height: 0,
        width: double.maxFinite,
      );
  }

  Widget periodChild() {
    if (female == true) {
      return RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
            text: "Period Tracker : ",
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold)),
            children: [
              TextSpan(
                text: selcPeriod,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: activeColorP)),
              )
            ]),
      );
    } else {
      return SizedBox(
        height: 0,
        width: double.maxFinite,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
            alignment: Alignment.centerLeft,
            child: Text(
              "Welcome Back",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(fontSize: 30),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
            alignment: Alignment.centerLeft,
            child: Text(
              "$name",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: TableCalendar(
              locale: "en_US",
              onDaySelected: (day, events, holidays) {
                if (holidays.isEmpty) {
                  activeColor = Colors.red;
                  selcExercise = "You were Inactive this Day!";
                  if (events.isEmpty) {
                    activeColorP = Colors.black;
                    selcPeriod = "Period's are'nt Expected!";
                  } else {
                    var x = DateTime.now();
                    var y = day.compareTo(x);
                    // print(y);
                    if (y < 0) {
                      activeColorP = Colors.pink;
                      selcPeriod = "You had Periods this Day";
                    } else {
                      activeColorP = Colors.pink;
                      selcPeriod = "Periods are expected this Day";
                    }
                  }
                } else {
                  activeColor = Colors.green;
                  selcExercise = "You were Active this Day!";
                  if (events.isEmpty) {
                    activeColorP = Colors.black;
                    selcPeriod = "Period's are'nt Expected!";
                  } else {
                    var x = DateTime.now();
                    var y = day.compareTo(x);
                    // print(y);
                    if (y < 0) {
                      activeColorP = Colors.pink;
                      selcPeriod = "You had Periods this Day";
                    } else {
                      activeColorP = Colors.pink;
                      selcPeriod = "Periods are expected";
                    }
                  }
                }
                setState(() {});
              },
              events: {},
              holidays: {},
              calendarController: _calendarController,
              calendarStyle: CalendarStyle(
                holidayStyle: TextStyle(color: Colors.green[700], fontSize: 20),
                weekendStyle: TextStyle(color: Colors.black),
                selectedColor: Colors.blue[900],
                todayColor: Colors.blue,
                markersColor: Colors.pink,
                outsideDaysVisible: false,
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
            alignment: Alignment.center,
            child: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                  text: "Activity : ",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                  children: [
                    TextSpan(
                      text: selcExercise,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: activeColor)),
                    )
                  ]),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: periodChild(),
          ),
          Divider(),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 20, 0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 150,
                    child: Image.asset("lib/assets/exercise.gif"),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Fitness",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      child: Text(
                        "click the button to start tracker",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(fontSize: 16)),
                      ),
                    ),
                    Container(
                      width: 200,
                      alignment: Alignment.center,
                      child: OutlineButton(
                        splashColor: Colors.blueAccent[200],
                        highlightedBorderColor: Colors.blue[700],
                        borderSide:
                            BorderSide(color: Colors.blue[700], width: 2),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FitnessScreen(),
                              ));
                        },
                        child: Text(
                          "Explore",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue[700],
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          genderChild(),
        ],
      ),
    ));
  }
}
