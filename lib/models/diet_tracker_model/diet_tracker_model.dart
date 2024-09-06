
import 'package:hive_flutter/adapters.dart';
part 'diet_tracker_model.g.dart';

@HiveType(typeId: 5)
class DietTrackerModel {
    @HiveField(0)
 final String category;
  @HiveField(1)
 final String image;
  @HiveField(2)
  final String description;

  DietTrackerModel({
     required this.category,
    required this.image, 
  required this.description
 });

  
}
