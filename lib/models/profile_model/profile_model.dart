
//ProfileModel
import 'package:hive/hive.dart';
part 'profile_model.g.dart';

@HiveType(typeId: 0)
class ProfileModel {
  @HiveField(0)
   String? image;
  @HiveField(1)
   String? name;
  @HiveField(2)
   String? age;
  @HiveField(3)
   String? gender;
  @HiveField(4)
   String? height;
  @HiveField(5)
   String? weight;
  



ProfileModel(
  {
    required this.image,
    required this.name,
    required this.age,
    required this.gender,
    required this.height,
    required this.weight,
  }
);
}


