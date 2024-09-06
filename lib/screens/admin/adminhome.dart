import 'package:fitpro/widget/colors.dart';
import 'package:fitpro/widget/customAdminContainer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Adminhome extends StatefulWidget {
  const Adminhome({super.key});

  @override
  State<Adminhome> createState() => _TrainingState();
}

class _TrainingState extends State<Adminhome> {
  void _showLogoutConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Logout"),
          content: const Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Logout"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 25, 28, 26),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: MyColors.White),
        title: const Text(
          'HOME',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: _showLogoutConfirmationDialog,
              icon: const Icon(FontAwesomeIcons.rightFromBracket),
            ),
          )
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(       
          gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing:0,
            mainAxisSpacing: 0,
            childAspectRatio: 3/5
          ),
          itemCount: adminGridViewList.length,
          itemBuilder: (BuildContext context, int index) {
            return CustomAdminContainer(
              imagePath: adminGridViewList[index].imagePath,
              navigate: adminGridViewList[index].navigate,
            );
          },
        ),
      ),
    );
  }
}

showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          color: MyColors.DBlack,
        ),
      ),
      backgroundColor: MyColors.White,
      duration: const Duration(
        seconds: 1,
      ),
    ),
  );
}
