import 'package:fitpro/db_functions/database_db.dart';
import 'package:fitpro/screens/user/excercise_details.dart';
import 'package:fitpro/screens/user/workout.dart';
import 'package:flutter/material.dart';

class Beginner extends StatefulWidget {
  const Beginner({super.key});

  @override
  State<Beginner> createState() => _BeginnerState();
}

class _BeginnerState extends State<Beginner> {
  var a = 0;

  @override
  void initState() {
    beginnerGetAllWorkout();
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
          'BEGINNER',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ValueListenableBuilder(
                valueListenable: beginnerWorkoutList,
                builder: (context, workouts, child) {
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      final workout = workouts[index];
                      a = index;
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
                    itemCount: workouts.length,
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => Workout(workoutList: beginnerWorkoutList.value)));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                ),
                child: const Text(
                  'START',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
