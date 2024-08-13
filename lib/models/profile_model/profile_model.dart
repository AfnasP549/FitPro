
//ProfileModel
import 'package:hive/hive.dart';
part 'profile_model.g.dart';

@HiveType(typeId: 0)
class ProfileModel {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late String age;
  @HiveField(2)
  late String gender;
  @HiveField(3)
  late String height;
  @HiveField(4)
  late String weight;
  



ProfileModel(
  {
    required this.name,
    required this.age,
    required this.gender,
    required this.height,
    required this.weight,
  }
);
}


