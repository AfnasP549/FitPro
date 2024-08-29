  import 'package:fitpro/screens/admin/advanced/admin_advanced.dart';
  import 'package:fitpro/screens/admin/beginner/admin_beginner.dart';
  import 'package:fitpro/screens/admin/diet_tracker/diet_tracker.dart';
  import 'package:fitpro/screens/admin/intermediate/admin_intermediate.dart';
  import 'package:flutter/material.dart';

  class CustomAdminContainer extends StatelessWidget {
    final String imagePath;
    //final String title;
    // final String buttonText;
    final Widget navigate;
    const CustomAdminContainer({
      super.key,
      required this.imagePath,
    // required this.title,
      // required this.buttonText,
      required this.navigate,
    });

    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>navigate));
          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(imagePath),
              fit: BoxFit.cover),
            //color: MyColors.DBlack,
            borderRadius: BorderRadius.circular(16)
            ),
            height: 500,
            child: const SizedBox(
              height: 10,
            ),
          ),
        ),
      );
    }
  }

  List<AdminGridContainer> adminGridViewList = [
    AdminGridContainer(
      imagePath: 'images/AdminBeginner.png',
      //title: 'BEGINNER',
      navigate: const AdminBeginner(),
    ),
    AdminGridContainer(
      imagePath: 'images/AdminIntermediate.png',
      //title: 'INTERMEDIATE',
      navigate: const AdminIntermediate(),
    ),
    AdminGridContainer(
      imagePath: 'images/AdminAdvanced.png',
    // title: 'ADVANCED',
      navigate: const AdminAdvanced(),
    ),
    AdminGridContainer(
      imagePath: 'images/DietTracker.png',
      //title: 'DIET TRACKER',
      navigate: const DietTracker(),
    ),
  ];

  class AdminGridContainer {
    final String imagePath;
  // final String title;
    final Widget navigate;
    // final String buttonText;

    AdminGridContainer({
      required this.imagePath,
    // required this.title,
      required this.navigate,
      //required this.buttonText,
    });
  }
