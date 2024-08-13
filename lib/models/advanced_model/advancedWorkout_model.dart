import 'package:hive_flutter/adapters.dart';
part 'advancedWorkout_model.g.dart';
  @HiveType(typeId: 3)
class AdvancedWorkoutModel {
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

  AdvancedWorkoutModel(
      {required this.url,
      required this.name,
      required this.description,
      required this.duration});
}
