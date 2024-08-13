import 'package:fitpro/db_functions/database_db.dart';
import 'package:fitpro/models/beginner_model/beginnerWorkout_model.dart';
import 'package:fitpro/screens/admin/beginner/admin_beginner_add.dart';
import 'package:fitpro/screens/admin/beginner/admin_beginner_edit.dart';
import 'package:flutter/material.dart';

class AdminBeginner extends StatefulWidget {
  const AdminBeginner({super.key,});
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
      appBar: AppBar(title: Text('BEGINNER')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (ctx) => AdminBeginnerAdd(workoutModel: BeginnerWorkoutModel,)));
        },
        child: const Icon(Icons.add),
      ),
      body: ValueListenableBuilder(
        valueListenable: beginnerWorkoutList,
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
                                    builder: (ctx) => AdminBeginnerEdit(
                                          index: index,
                                          beginnerWorkout: workoutList[index],
                                        )));
                               beginnerGetAllWorkout();
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
                                beginnerDeleteWorkout(index);
                                beginnerGetAllWorkout();
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
