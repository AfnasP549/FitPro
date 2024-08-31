import 'dart:developer';

import 'package:fitpro/db_functions/diet_tracker_db.dart';
import 'package:fitpro/models/diet_tracker_model/diet_tracker_model.dart';
import 'package:fitpro/screens/admin/diet_tracker/diet_tracker_add.dart';

import 'package:fitpro/widget/colors.dart';
import 'package:flutter/material.dart';

class CustomDietContainer extends StatelessWidget {
  final String imgPath;
  final String catergory;
  const CustomDietContainer({
    required this.imgPath,
    required this.catergory,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        DietTrackerModel? dietmodel = getDietTracker('underWeight');
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => DietTrackerAdd(
                category: catergory, dietTrackerModel: dietmodel)));
      },
      child: Container(
        height: 250,
        decoration: BoxDecoration(
          color: MyColors.DBlack,
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(image: AssetImage(imgPath)),
          
        ),
        child: const Center(
          child: Text('weight',
          style: TextStyle(
            color: MyColors.Amber,
            fontWeight: FontWeight.bold,
          ),),
        ),
      ),
    );
  }
}

List<CustomAdminDiet> customDietGridViewList = [
  CustomAdminDiet(imgPath: '', category: 'underWeight'),
  CustomAdminDiet(imgPath: '', category: 'normalWeight'),
  CustomAdminDiet(imgPath: '', category: 'overWeight'),
  CustomAdminDiet(imgPath: '', category: 'obesity'),
];

class CustomAdminDiet {
  final String imgPath;
  final String category;

  CustomAdminDiet({required this.imgPath, required this.category});
}

DietTrackerModel? getDietTracker(String category) {
  try {
    log('message');
    return dietTrackerList.value.firstWhere(
      (element) => element.category == category,
    );
  } catch (_) {
    log('message');
    return null;
  }
}
