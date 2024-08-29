import 'package:fitpro/db_functions/database_db.dart';
import 'package:fitpro/models/advanced_model/advancedWorkout_model.dart';
import 'package:fitpro/screens/admin/advanced/advanced_add.dart';
import 'package:fitpro/screens/admin/advanced/advanced_edit.dart';
import 'package:fitpro/widget/colors.dart';
import 'package:fitpro/widget/custom_appbar.dart';
import 'package:fitpro/widget/delete_alert.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdminAdvanced extends StatefulWidget {
  const AdminAdvanced({super.key,});
  @override
  State<AdminAdvanced> createState() => _AdvancedState();
}

class _AdvancedState extends State<AdminAdvanced> {
  @override
  void initState() {
    advancedGetAllWorkout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.Black,
      appBar: customAppBar(context, text1: 'ADVANCED',back: true),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColors.White,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (ctx) => AdvancedAdd(
                    workoutModel: AdvancedWorkoutModel,)));
        },
        child: const Icon(Icons.add),
      ),
      body: ValueListenableBuilder(
        valueListenable: advancedWorkoutList,
        builder: (BuildContext context, List workoutList, child) {
          return ListView.builder(
              itemCount: workoutList.length,
              itemBuilder: (ctx, index) {
                final data = workoutList[index];

                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: MyColors.DBlack,
                      border: Border.all(),
                    ),
                    child: ListTile(
                      title: Text(data.name,
                      style: const TextStyle(
                        color: MyColors.White,
                      ),),
                      subtitle: Text(data.duration,
                      style: const TextStyle(
                        color: MyColors.White,
                      ),),
                      trailing: Wrap(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (ctx) => AdvancedEdit(
                                          index: index,
                                          advancedWorkout: workoutList[index],
                                        )));
                               advancedGetAllWorkout();
                              },
                              icon: const Icon(
                                 FontAwesomeIcons.penToSquare,
                            color: MyColors.Orange,
                              )),
                          const SizedBox(
                            width: 20,
                          ),
                          IconButton(
                              onPressed: () {
                                showDeleteDialog(index, context);
                              },
                              icon: const Icon(
                                 FontAwesomeIcons.trashCan,
                            color:MyColors.Red,
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
