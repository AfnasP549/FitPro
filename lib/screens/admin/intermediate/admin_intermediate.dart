import 'package:fitproo/db_functions/database_db.dart';
import 'package:fitproo/models/intermediate_model/intermediateWorkout_model.dart';
import 'package:fitproo/screens/admin/intermediate/intermediate_add.dart';
import 'package:fitproo/screens/admin/intermediate/intermediate_edit.dart';
import 'package:fitproo/widget/colors.dart';
import 'package:fitproo/widget/custom_appbar.dart';
import 'package:fitproo/widget/delete_alert.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdminIntermediate extends StatefulWidget {
  const AdminIntermediate({super.key,});
  @override
  State<AdminIntermediate> createState() => _AdminintermediateState();
}

class _AdminintermediateState extends State<AdminIntermediate> {
  @override
  void initState() {
    intermediateGetAllWorkout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.Black,
      appBar: customAppBar(context, text1: 'INTERMEDIATE',back: true),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColors.White,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (ctx) => IntermediateAdd(workoutModel: IntermediateWorkoutModel,)));
        },
        child: const Icon(Icons.add),
      ),
      body: ValueListenableBuilder(
        valueListenable: interMediateWorkoutList,
        builder: (BuildContext context, List workoutList, child) {
          return ListView.builder(
              itemCount: workoutList.length,
              itemBuilder: (ctx, index) {
                final data = workoutList[index];

                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: MyColors.Black,
                      ),
                      color: MyColors.DBlack,
                    ),
                    child: ListTile(
                      title: Text(data.name,
                       style: const TextStyle(
                    color: MyColors.White,
                  ),
                      ),
                      subtitle: Text(data.duration,
                       style: const TextStyle(
                    color: MyColors.White,
                  ),
                      ),
                      trailing: Wrap(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (ctx) => IntermediateEdit(
                                          index: index,
                                          intermediateWorkout: workoutList[index],
                                        )));
                               intermediateGetAllWorkout();
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
                             showDeleteDialog( index, context );
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
