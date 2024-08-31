
import 'package:fitpro/widget/colors.dart';
import 'package:fitpro/widget/customDietContainer.dart';
import 'package:fitpro/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class DietTracker extends StatelessWidget {
  const DietTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.Black,
      appBar: customAppBar(context, text1: 'Diet Tracker', back: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          shrinkWrap: true,
          //physics: NeverScrollableScrollPhysics(),
            itemCount: customDietGridViewList.length,
            itemBuilder: (context, index) {
            return CustomDietContainer(
              imgPath: customDietGridViewList[index].imgPath,  
              catergory: customDietGridViewList[index].category,
            );
          }),
      ),
    );
  }
}
