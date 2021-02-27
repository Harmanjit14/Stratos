import 'package:Stratos/Models/user.dart';
import 'package:Stratos/Screens/home.dart';
import 'package:Stratos/Server/profileData.dart';
import 'package:Stratos/Server/signIn.dart';
import 'package:Stratos/Server/signUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  String email, password, name;
  int stateBut = 0;
  int but = 0;

  Widget logChild() {
    switch (stateBut) {
      case 0:
        {
          return Text(
            "Continue",
            style: GoogleFonts.poppins(
                textStyle: TextStyle(fontSize: 20, color: Colors.white)),
          );
        }
        break;
      case 1:
        {
          return SpinKitDoubleBounce(
            color: Colors.white,
            size: 30.0,
          );
        }
        break;
      case 2:
        {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check,
                color: Colors.white,
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                "Success",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          );
        }
        break;
      case 3:
        {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error,
                color: Colors.white,
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                "Check Credentials!",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          );
        }
        break;
      default:
        {
          return Text(
            "Continue",
            style: GoogleFonts.poppins(
                textStyle: TextStyle(fontSize: 20, color: Colors.white)),
          );
        }
    }
  }

  Widget login() {
    return Container(
        child: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Image.asset(
                      "assets/log.gif",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    // alignment: Alignment.center,
                    child: Text(
                      "Login Here!",
                      style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          textStyle: TextStyle(color: Colors.black),
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(0.5, 0.5),
                              blurRadius: 2,
                              color: Colors.black,
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextFormField(
                onChanged: (val) {
                  email = val;
                },
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                    focusColor: Colors.white,
                    fillColor: Colors.grey[200],
                    filled: true,
                    hintText: "Email",
                    prefixIcon: Icon(
                      Icons.person,
                    ),
                    hintStyle: TextStyle(fontSize: 18),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none)),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 15, 20, 0),
              child: TextFormField(
                onChanged: (val) {
                  password = val;
                },
                keyboardType: TextInputType.text,
                obscureText: true,
                style: TextStyle(fontSize: 18),
                obscuringCharacter: "*",
                decoration: InputDecoration(
                    focusColor: Colors.white,
                    fillColor: Colors.grey[200],
                    filled: true,
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock),
                    hintStyle: TextStyle(fontSize: 18),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none)),
              ),
            ),
            Container(
              width: double.maxFinite,
              margin: EdgeInsets.fromLTRB(20, 25, 20, 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: RaisedButton(
                  padding: EdgeInsets.all(15),
                  onPressed: () async {
                    stateBut = 1;
                    setState(() {});
                    int temp = await getToken(email, password,);
                    int temp2 = await me();
                    if (temp == 1 && temp2 == 1) {
                      Timer(Duration(seconds: 2), () {
                        stateBut = 2;
                        setState(() {});
                      });
                      Timer(Duration(seconds: 3), () {
                        password = null;
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      });
                    } else {
                      Timer(Duration(seconds: 2), () {
                        stateBut = 3;
                        setState(() {});
                      });
                      Timer(Duration(seconds: 4), () {
                        stateBut = 0;
                        setState(() {});
                      });
                    }
                  },
                  child: logChild(),
                  color: Colors.blueAccent,
                ),
              ),
            ),
            SizedBox(height: 60),
            Container(
              width: double.maxFinite,
              margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      child: Text(
                    "Don't have an account ?",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )),
                  SizedBox(width: 20),
                  Container(
                    child: IconButton(
                        color: Colors.black,
                        iconSize: 30,
                        icon: Icon(Icons.chevron_right),
                        onPressed: () {
                          but = 1;
                          setState(() {});
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget register() {
    return Container(
        child: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Image.asset(
                      "assets/log.gif",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    child: Text(
                      "Register Here!",
                      style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          textStyle: TextStyle(color: Colors.black),
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(0.5, 0.5),
                              blurRadius: 2,
                              color: Colors.black,
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextFormField(
                onChanged: (val) {
                  email = val;
                },
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                    focusColor: Colors.white,
                    fillColor: Colors.grey[200],
                    filled: true,
                    hintText: "Email",
                    prefixIcon: Icon(
                      Icons.person,
                    ),
                    hintStyle: TextStyle(fontSize: 18),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none)),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 15, 20, 0),
              child: TextFormField(
                onChanged: (val) {
                  name = val;
                },
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                    focusColor: Colors.white,
                    fillColor: Colors.grey[200],
                    filled: true,
                    hintText: "Name",
                    prefixIcon: Icon(
                      Icons.contact_mail_rounded,
                    ),
                    hintStyle: TextStyle(fontSize: 18),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none)),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 15, 20, 0),
              child: TextFormField(
                onChanged: (val) {
                  password = val;
                },
                keyboardType: TextInputType.text,
                obscureText: true,
                style: TextStyle(fontSize: 18),
                obscuringCharacter: "*",
                decoration: InputDecoration(
                    focusColor: Colors.white,
                    fillColor: Colors.grey[200],
                    filled: true,
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock),
                    hintStyle: TextStyle(fontSize: 18),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none)),
              ),
            ),
            Container(
              width: double.maxFinite,
              margin: EdgeInsets.fromLTRB(20, 25, 20, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: RaisedButton(
                  padding: EdgeInsets.all(15),
                  onPressed: () async {
                    stateBut = 1;
                    setState(() {});
                    int temp = await createUser(email, password);
                    int temp3 = await getToken(email, password);
                    int temp2 = await me();
                    if (temp == 1 && temp2 == 1 && temp3 == 1) {
                      Timer(Duration(seconds: 2), () {
                        stateBut = 2;
                        setState(() {});
                      });
                      Timer(Duration(seconds: 3), () {
                        password = "";
                        Navigator.pushReplacementNamed(context, "/home");
                        password = null;
                      });
                    } else {
                      Timer(Duration(seconds: 2), () {
                        stateBut = 3;
                        setState(() {});
                      });
                      Timer(Duration(seconds: 4), () {
                        stateBut = 0;
                        setState(() {});
                      });
                    }
                  },
                  child: logChild(),
                  color: Colors.greenAccent[700],
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: double.maxFinite,
              margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      child: Text(
                    "Have an account ?",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )),
                  SizedBox(width: 20),
                  Container(
                    child: IconButton(
                        color: Colors.black,
                        iconSize: 30,
                        icon: Icon(Icons.chevron_right),
                        onPressed: () {
                          but = 0;
                          setState(() {});
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    switch (but) {
      case 0:
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: login(),
          ),
        );

        break;
      case 1:
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: register(),
          ),
        );
      default:
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: login(),
          ),
        );
    }
  }
}
