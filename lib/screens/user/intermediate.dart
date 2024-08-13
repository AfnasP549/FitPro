// ignore_for_file: file_names

import 'package:fitpro/db_functions/database_db.dart';
import 'package:fitpro/screens/user/excercise_details.dart';
import 'package:fitpro/screens/user/workout.dart';
import 'package:flutter/material.dart';

class Intermediate extends StatefulWidget {
  const Intermediate({super.key});

  @override
  State<Intermediate> createState() => _IntermediateState();
}

class _IntermediateState extends State<Intermediate> {
  @override
  void initState() {
    intermediateGetAllWorkout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 25, 28, 26),
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'INTERMEDIATE',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ValueListenableBuilder(
          valueListenable: interMediateWorkoutList,
          builder: (context, workouts, child) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  final workout = workouts[index];
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => ExcerciseDetails(
                              url: workout.url,
                              name: workout.name,
                              description: workout.description),
                        ),
                      );
                    },
                    leading: Image.asset('images/ADVANCED.png'),
                    title: Text(
                      workout.name,
                      style: const TextStyle(color: Colors.amber),
                    ),
                    subtitle: Text(
                      workout.duration,
                      style: const TextStyle(color: Colors.amber),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: workouts.length);
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: ElevatedButton(
          onPressed: () {
             Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => Workout(workoutList: interMediateWorkoutList.value)));
          },
          child: const Text(
            'START',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
