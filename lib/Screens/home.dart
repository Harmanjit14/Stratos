import 'package:Stratos/Models/user.dart';
import 'package:Stratos/Screens/Profile.dart';
import 'package:Stratos/Screens/exerciseScreen.dart';
import 'package:Stratos/Screens/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'health.dart';

enum _SelectedTab { home, health, aware, work, profile }

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _selectedTab = _SelectedTab.home;
  int index = 0;
  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
      setState(() {
        index = i;
      });
    });
  }

  Widget navbar() {
    switch (index) {
      case 0:
        {
          return MainScreen();
        }
        break;
      case 1:
        {
          return ExerciseScreen();
        }
        break;
      case 2:
        {
          return HealthPage();
        }
        break;
      case 3:
        {
          return ProfileSceen();
        }
        break;

      default:
        {
          return MainScreen();
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: navbar(),
      bottomNavigationBar: Container(
        //height: 100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SalomonBottomBar(
              currentIndex: _SelectedTab.values.indexOf(_selectedTab),
              onTap: _handleIndexChanged,
              items: [
                /// Home
                SalomonBottomBarItem(
                  icon: Icon(Icons.home),
                  title: Text("Home"),
                  selectedColor: Colors.blue[700],
                ),

                /// Likes
                SalomonBottomBarItem(
                  icon: Icon(Icons.fitness_center),
                  title: Text("Exercise"),
                  selectedColor: Colors.amber,
                ),
                SalomonBottomBarItem(
                  icon: Icon(Icons.local_hospital_rounded),
                  title: Text("Health"),
                  selectedColor: Colors.pink,
                ),

                /// Search

                /// Profile
                SalomonBottomBarItem(
                  icon: Icon(Icons.person),
                  title: Text("Profile"),
                  selectedColor: Colors.teal,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
