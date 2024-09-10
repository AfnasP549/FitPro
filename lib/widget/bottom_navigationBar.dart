// ignore_for_file: file_names

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fitproo/screens/user/bmi.dart';
import 'package:fitproo/screens/user/diet_screen.dart';
import 'package:fitproo/screens/user/history.dart';
import 'package:fitproo/screens/user/home.dart';
import 'package:fitproo/widget/colors.dart';
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
     const Bmi(),
     const DietScreen(),
      const History(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          index: _currentIndex,
          animationDuration: const Duration(milliseconds: 200),
          backgroundColor: MyColors.Black,
          color: const Color.fromARGB(255, 38, 38, 38),
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          items: const [
            Icon(
              FontAwesomeIcons.house,
              color: Colors.white,
            ),
            Icon(
             FontAwesomeIcons.weightScale,
              color: Colors.white,
            ),
            Icon(
              FontAwesomeIcons.bowlFood,
              color: Colors.white,
            ),
            Icon(
              FontAwesomeIcons.clockRotateLeft,
              color: Colors.white,
            ),
          ]),
      body: Pages[_currentIndex],
    );
  }
}
