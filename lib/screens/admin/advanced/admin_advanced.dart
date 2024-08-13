import 'package:fitpro/db_functions/database_db.dart';
import 'package:fitpro/models/advanced_model/advancedWorkout_model.dart';
import 'package:fitpro/screens/admin/advanced/advanced_add.dart';
import 'package:fitpro/screens/admin/advanced/advanced_edit.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(title: Text('ADVANCED')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (ctx) => AdvancedAdd(workoutModel: AdvancedWorkoutModel,)));
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
                                    builder: (ctx) => AdvancedEdit(
                                          index: index,
                                          advancedWorkout: workoutList[index],
                                        )));
                               advancedGetAllWorkout();
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
                                advancedDeleteWorkout(index);
                                advancedGetAllWorkout();
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
