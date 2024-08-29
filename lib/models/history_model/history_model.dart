import 'package:hive/hive.dart';

part 'history_model.g.dart'; // Ensure this part directive matches your generated file

@HiveType(typeId: 4) // Ensure this typeId is unique
class WorkoutHistoryModel extends HiveObject {
  @HiveField(0)
  String workoutName;

  @HiveField(1)
  int duration;

  @HiveField(2)
  DateTime date;

  WorkoutHistoryModel({
    required this.workoutName,
    required this.duration,
    required this.date,
  });
}


