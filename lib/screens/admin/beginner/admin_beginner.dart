import 'package:fitpro/db_functions/database_db.dart';
import 'package:fitpro/models/beginner_model/beginnerWorkout_model.dart';
import 'package:fitpro/screens/admin/beginner/beginner_add.dart';
import 'package:fitpro/screens/admin/beginner/beginner_edit.dart';
import 'package:fitpro/widget/colors.dart';
import 'package:fitpro/widget/custom_appbar.dart';
import 'package:fitpro/widget/delete_alert.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdminBeginner extends StatefulWidget {
  const AdminBeginner({
    super.key,
  });
  @override
  State<AdminBeginner> createState() => _AdminBeginnerState();
}

class _AdminBeginnerState extends State<AdminBeginner> {
  @override
  void initState() {
    beginnerGetAllWorkout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 25, 28, 26),
      appBar: customAppBar(context, text1: 'BEGINNER',back: true),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColors.White,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) =>
                  BeginnerAdd(workoutModel: BeginnerWorkoutModel),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ValueListenableBuilder(
        valueListenable: beginnerWorkoutList,
        builder: (BuildContext context, List workoutList, _) {
          return ListView.builder(
            itemCount: workoutList.length,
            itemBuilder: (ctx, index) {
              final data = workoutList[index];                                                                                                               

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      
                    ),
                    color: MyColors.DBlack
                  ),
                  child: ListTile(
                    title: Text(
                      data.name,
                      style: const TextStyle(
                        color: MyColors.White,
                      ),
                    ),
                    subtitle: Text(
                      data.duration,
                      style: const TextStyle(
                        color: MyColors.White,
                      ),
                    ),
                    trailing: Wrap(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => BeginnerEdit(
                                index: index,
                                beginnerWorkout: workoutList[index],
                              ),
                            ));
                            beginnerGetAllWorkout();
                          },
                          icon: const Icon(
                            FontAwesomeIcons.penToSquare,
                            color: MyColors.Orange,
                          ),
                        ),
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
