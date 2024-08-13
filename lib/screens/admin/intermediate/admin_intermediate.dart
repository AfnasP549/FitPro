import 'package:fitpro/db_functions/database_db.dart';
import 'package:fitpro/models/beginner_model/beginnerWorkout_model.dart';
import 'package:fitpro/models/intermediate_model/intermediateWorkout_model.dart';
import 'package:fitpro/screens/admin/beginner/admin_beginner_add.dart';
import 'package:fitpro/screens/admin/beginner/admin_beginner_edit.dart';
import 'package:fitpro/screens/admin/intermediate/intermediate_add.dart';
import 'package:fitpro/screens/admin/intermediate/intermediate_edit.dart';
import 'package:flutter/material.dart';

class AdminIntermediate extends StatefulWidget {
  const AdminIntermediate({super.key,});
  @override
  State<AdminIntermediate> createState() => _AdminBeginnerState();
}

class _AdminBeginnerState extends State<AdminIntermediate> {
  @override
  void initState() {
    intermediateGetAllWorkout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('INTERMEDIATE')),
      floatingActionButton: FloatingActionButton(
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
                      border: Border.all(),
                    ),
                    child: ListTile(
                      title: Text(data.name),
                      subtitle: Text(data.duration),
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
                                Icons.edit,
                                color: Colors.blue,
                              )),
                          const SizedBox(
                            width: 20,
                          ),
                          IconButton(
                              onPressed: () {
                               intermediateDeleteWorkout(index);
                                intermediateGetAllWorkout();
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
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
