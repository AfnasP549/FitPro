// ignore_for_file: file_names

import 'package:hive_flutter/adapters.dart';
part 'beginnerWorkout_model.g.dart';

@HiveType(typeId: 1)
class BeginnerWorkoutModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String url;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final String duration;
  @HiveField(5)
  bool isFavorite;

  BeginnerWorkoutModel(
      {required this.url,
      required this.name,
      required this.description,
      required this.duration,
      this.isFavorite = false, 
      this.id});
}






