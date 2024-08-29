// ignore_for_file: file_names

import 'package:hive_flutter/adapters.dart';
part 'intermediateWorkout_model.g.dart';

@HiveType(typeId: 2)
class IntermediateWorkoutModel {
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


  IntermediateWorkoutModel(
      {required this.url,
      required this.name,
      required this.description,
      required this.duration,
      this.isFavorite = false, });
}
