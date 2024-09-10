import 'package:fitproo/db_functions/database_db.dart';
import 'package:fitproo/models/intermediate_model/intermediateWorkout_model.dart';
import 'package:fitproo/screens/admin/adminhome.dart';
import 'package:fitproo/screens/user/excercise_details.dart';
import 'package:fitproo/screens/user/intermediate/favorite_.dart';
import 'package:fitproo/screens/user/workout.dart';
import 'package:fitproo/widget/colors.dart';
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

  void _toggleFavorite(IntermediateWorkoutModel workout, int index) async {
 
  workout.isFavorite = !workout.isFavorite;

  await intermediateEditWorkout(workout, index);

  setState(() {
    interMediateWorkoutList.value[index] = workout;
    interMediateWorkoutList.notifyListeners(); 
  });

  final snackBarText = workout.isFavorite
      ? 'Added to Favorites'
      : 'Removed from Favorites';
  // ignore: use_build_context_synchronously
  showSnackBar(context, snackBarText);
}


  void _navigateToFavorites() async {
    final favoriteWorkouts = interMediateWorkoutList.value
        .where((workout) => workout.isFavorite)
        .toList();

    
    final shouldUpdate = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => Favorites(
          favoriteWorkout: favoriteWorkouts,
          onUpdate: _refreshList,
        ),
      ),
    );

    if (shouldUpdate == true) {
      _refreshList();
    }
  }

  void _refreshList() {
    setState(() {
      interMediateWorkoutList.notifyListeners();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.Black,
      appBar: AppBar(
        backgroundColor: MyColors.DBlack,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'INTERMEDIATE',
          style: TextStyle(
            color: MyColors.White,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: _navigateToFavorites,
            child: const Text(
              'Favorites',
              style: TextStyle(
                color: MyColors.Red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ValueListenableBuilder(
          valueListenable: interMediateWorkoutList,
          builder: (context, workouts, child) {
            
              if (workouts.isEmpty) {
        return const Center(
            child: Text(
          'empty',
          style: TextStyle(color: MyColors.White),
        ));
      }
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      final workout = workouts[index];
                      return ListTile(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => ExcerciseDetails(
                                url: workout.url,
                                name: workout.name,
                                description: workout.description,
                              ),
                            ),
                          );
                        },
                        leading: Image.asset('images/ADVANCED.png'),
                        title: Text(
                          workout.name,
                          style: const TextStyle(color: MyColors.White),
                        ),
                        subtitle: Text(
                          '${workout.duration}s',
                          style: const TextStyle(color: MyColors.White),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            _toggleFavorite(workout, index);
                          },
                          icon: Icon(
                            workout.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: MyColors.Red,
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: workouts.length,
                  ),
                ),
                 Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => Workout(
                workoutList: interMediateWorkoutList.value,
              ),
            ));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.White,
            padding: const EdgeInsets.symmetric(vertical: 15.0),
          ),
          child: const Text(
            'START',
            style: TextStyle(
              color: MyColors.Black,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
            ),
              ],
            );
          },
        ),
      ),
    );
  }
}
