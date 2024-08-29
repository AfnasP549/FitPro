import 'package:fitpro/db_functions/database_db.dart';
import 'package:fitpro/screens/admin/adminhome.dart';
import 'package:fitpro/widget/colors.dart';
import 'package:flutter/material.dart';

void showDeleteDialog(int index, BuildContext context) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      backgroundColor: MyColors.Black,
      title: const Text('Delete Confirmation',
          style: TextStyle(color: Colors.white)),
      content: const Text('Are you sure you want to delete this workout?',
          style: TextStyle(color: Colors.white)),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(ctx).pop();
          },
          child: const Text('Cancel', style: TextStyle(color: Colors.blue)),
        ),
        TextButton(
          onPressed: () {
            beginnerDeleteWorkout(index);
            beginnerGetAllWorkout();
            intermediateDeleteWorkout(index);
            intermediateGetAllWorkout();
            advancedDeleteWorkout(index);
            advancedGetAllWorkout();
            Navigator.of(ctx).pop();
            showSnackBar(context, 'Workout deleted successfully!');
          },
          child: const Text('Delete', style: TextStyle(color: Colors.red)),
        ),
      ],
    ),
  );
}
