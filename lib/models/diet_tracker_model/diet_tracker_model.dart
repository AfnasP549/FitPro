import 'package:hive_flutter/adapters.dart';
part 'diet_tracker_model.g.dart';

@HiveType(typeId: 5)
class DietTrackerModel {
  @HiveField(0)
  final String imagePath;
  @HiveField(1)
  final String note;

  DietTrackerModel({
    required this.imagePath,
    required this.note,
  });
}
