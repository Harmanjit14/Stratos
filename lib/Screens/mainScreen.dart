import 'package:Stratos/Models/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

  Color activeColorP = Colors.black;
  String selcPeriod = "Period's are'nt Expected!";

  Color activeColor = Colors.green;
  String selcExercise = "You were Active this Day!";

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
            alignment: Alignment.centerLeft,
            child: periodChild(),
          ),
          Divider(),
        ],
      ),
    ));
  }
}
