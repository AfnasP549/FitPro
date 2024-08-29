import 'package:fitpro/db_functions/database_db.dart';
import 'package:fitpro/models/intermediate_model/intermediateWorkout_model.dart';
import 'package:fitpro/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:fitpro/models/beginner_model/beginnerWorkout_model.dart';
import 'package:fitpro/screens/user/excercise_details.dart';
import 'package:fitpro/screens/user/workout.dart';
import 'package:fitpro/widget/colors.dart';

class Favorite extends StatefulWidget {
  final List<BeginnerWorkoutModel> favoriteWorkouts;
  final VoidCallback onUpdate; 
  // ignore: use_super_parameters
  const Favorite({Key? key, required this.favoriteWorkouts, required this.onUpdate, required List workoutList, required List<IntermediateWorkoutModel> favoriteWorkout}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  Future<void> _toggleFavorite(BeginnerWorkoutModel workout) async {
    final index = widget.favoriteWorkouts.indexWhere((w) => w.name == workout.name);

    if (index == -1) {
      return;
    }

    if (workout.isFavorite) {
      final shouldRemove = await showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Remove from Favorites"),
            content: const Text("Are you sure you want to remove this workout from your favorites?"),
            actions: [
              TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text("Cancel")),
              TextButton(onPressed: () => Navigator.of(context).pop(true), child: const Text("Remove")),
            ],
          );
        },
      );

      if (shouldRemove == true) {
        workout.isFavorite = false;

        setState(() {
          widget.favoriteWorkouts.removeAt(index);
        });

        widget.onUpdate(); 
      }
    } else {
      workout.isFavorite = true;
      await beginnerEditWorkout(workout, index);
      setState(() {
        widget.favoriteWorkouts.add(workout);
      });

      widget.onUpdate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.Black,
      appBar: customAppBar(context, text1: 'Fav', back: true),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final workout = widget.favoriteWorkouts[index];
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
                        _toggleFavorite(workout);
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
                itemCount: widget.favoriteWorkouts.length,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => Workout(
                        workoutList: widget.favoriteWorkouts,
                      ),
                    ),
                  );
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
      ),
    );
  }
}
