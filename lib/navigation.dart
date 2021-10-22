import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:garage_in_a_click/homepage.dart';
import 'package:garage_in_a_click/screens/home_screen.dart';
import 'package:garage_in_a_click/screens/profile/profilescreen.dart';
import 'package:google_sign_in/google_sign_in.dart';



class MyNavBar extends StatefulWidget {
  const MyNavBar({Key? key}) : super(key: key);

  @override
  _MyNavBarState createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  int currentIndex = 0;
  List screenList = [
    const HomeScreen(),
    const ChatMainScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MY HACKATHON APP!!'),
          backgroundColor: Colors.purple,
        ),
        body: screenList[currentIndex],
        bottomNavigationBar: BottomNavyBar(
            animationDuration: const Duration(milliseconds: 200),
            selectedIndex: currentIndex,
            onItemSelected: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              BottomNavyBarItem(
                icon: const Icon(Icons.home),
                title: const Text('      HOME'),
                activeColor: Colors.purple,
                inactiveColor: Colors.black,
              ),
              BottomNavyBarItem(
                icon: const Icon(Icons.chat),
                title: const Text('      CHAT'),
                activeColor: Colors.purple,
                inactiveColor: Colors.black,
              ),
              BottomNavyBarItem(
                icon: const Icon(Icons.person),
                title: const Text('    PROFILE'),
                activeColor: Colors.purple,
                inactiveColor: Colors.black,
              ),
            ]));
  }
}
