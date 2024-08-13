// ignore_for_file: file_names

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fitpro/screens/user/settings.dart';
import 'package:fitpro/screens/user/report.dart';
import 'package:fitpro/screens/user/diet_screen.dart';
import 'package:fitpro/screens/user/fovourite.dart';
import 'package:fitpro/screens/user/home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Bottomnavigationbar extends StatefulWidget {
  const Bottomnavigationbar({super.key});

  @override
  State<Bottomnavigationbar> createState() => _BottomnavigationbarState();
}

int _currentIndex = 0;

class _BottomnavigationbarState extends State<Bottomnavigationbar> {
  List<Widget> Pages = [
    const Home(),
    const Favourite(),
     Report(),
     const Dietscreen(),
    const Settings()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          index: _currentIndex,
          animationDuration: const Duration(milliseconds: 200),
          backgroundColor: Colors.black,
          color: const Color.fromARGB(255, 38, 38, 38),
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          items: const [
            Icon(
              Icons.home,
              color: Colors.white,
            ),
            Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            Icon(
              Icons.report,
              color: Colors.white,
            ),
            Icon(
              FontAwesomeIcons.utensils,
              color: Colors.white,
            ),
            Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ]),
      body: Pages[_currentIndex],
    );
  }
}
