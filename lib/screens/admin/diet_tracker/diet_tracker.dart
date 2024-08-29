import 'package:fitpro/db_functions/diet_tracker_db.dart';
import 'package:fitpro/widget/colors.dart';
import 'package:fitpro/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class DietTracker extends StatelessWidget {
  const DietTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.Black,
      appBar: customAppBar(
        context,
        text1: 'Diet Tracker',
        back: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColors.White,
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (ctx) =>
          //        // BeginnerAdd(workoutModel: BeginnerWorkoutModel),
          //   )
          // );
        },
        child: const Icon(Icons.add),
      ),
      body: ValueListenableBuilder(
          valueListenable: dietTrackerList,
          builder: (BuildContext context, List dietTrackerList, _) {
            return ListView.builder(
              itemCount: dietTrackerList.length,
              itemBuilder: (BuildContext ctx,int index){
                return ListTile(
                  
                );
              }
            );
          }),
    );
  }
}
