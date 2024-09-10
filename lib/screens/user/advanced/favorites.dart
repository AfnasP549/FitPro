import 'package:fitproo/models/advanced_model/advancedWorkout_model.dart';
import 'package:fitproo/screens/user/workout.dart';
import 'package:fitproo/screens/user/excercise_details.dart';
import 'package:fitproo/widget/colors.dart';
import 'package:fitproo/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Favorites__ extends StatefulWidget {
  final List<AdvancedWorkoutModel> favoriteWorkouts;
  final VoidCallback onUpdate;

  const Favorites__({
    super.key,
    required this.favoriteWorkouts,
    required this.onUpdate,
  });

  @override
  State<Favorites__> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites__> {
  Future<void> _toggleFavorite(AdvancedWorkoutModel workout) async {
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
      appBar: customAppBar(context, text1: 'Favorites', back: true),
      body: Column(
        children: [
          Expanded(
            child: widget.favoriteWorkouts.isEmpty
                ? const Center(
                    child: Text(
                      'No favorites added yet.',
                      style: TextStyle(color: MyColors.White),
                    ),
                  )
                : ListView.separated(
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
                          ).then((_) => widget.onUpdate());
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
                  ).then((_) => widget.onUpdate()); 
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.White,
                  padding: const EdgeInsets.symmetric(vertical: 15.0),

                ),
                child: const Text(
                  'START',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: MyColors.DBlack,
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
