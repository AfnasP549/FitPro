
import 'package:fitpro/models/advanced_model/advancedWorkout_model.dart';
import 'package:fitpro/models/intermediate_model/intermediateWorkout_model.dart';
import 'package:fitpro/models/profile_model/profile_model.dart';
import 'package:fitpro/models/beginner_model/beginnerWorkout_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/adapters.dart';



//for Beginner
ValueNotifier<List<BeginnerWorkoutModel>> beginnerWorkoutList =
    ValueNotifier([]);
Future<void> beginnerWorkoutAdd(BeginnerWorkoutModel value) async {
  final workoutDb = await Hive.openBox('beginner_workout_db');
  final id = await workoutDb.add(value);
  value.id = id;
  beginnerWorkoutList.value.add(value);
  beginnerWorkoutList.notifyListeners();
  
}

Future<void> beginnerGetAllWorkout() async {
  final workoutDb = await Hive.openBox('beginner_workout_db');
  beginnerWorkoutList.value.clear();
  beginnerWorkoutList.value.addAll(workoutDb.values.cast<BeginnerWorkoutModel>());
  beginnerWorkoutList.notifyListeners();
}

//delete
Future<void> beginnerDeleteWorkout(int index) async {
  final workoutDb = await Hive.openBox('beginner_workout_db');
  workoutDb.deleteAt(index);
}

//edit
Future<void>beginnerEditWorkout( BeginnerWorkoutModel workout , index)async{
  final workoutDb = await Hive.openBox('beginner_workout_db');
  await workoutDb.putAt(index, workout);
  beginnerGetAllWorkout();
}




//For Intermediate
ValueNotifier<List<IntermediateWorkoutModel>> interMediateWorkoutList = ValueNotifier([]);

Future<void>intermediateWorkoutAdd(IntermediateWorkoutModel value)async{
  final workoutDb = await Hive.openBox('intermediate_workout_db');
  final id= await workoutDb.add(value);
  value.id= id;
  interMediateWorkoutList.value.add(value);
  interMediateWorkoutList.notifyListeners();
}

Future<void>intermediateGetAllWorkout()async{
  final workoutDb = await Hive.openBox('intermediate_workout_db');
  interMediateWorkoutList.value.clear();
  interMediateWorkoutList.value.addAll(workoutDb.values.cast<IntermediateWorkoutModel>());
  interMediateWorkoutList.notifyListeners();
}

//delete for intermediate
Future<void>intermediateDeleteWorkout(int index)async{
  final workoutDb = await Hive.openBox('intermediate_workout_db');
  workoutDb.deleteAt(index);
}

//edit for intermediate
Future<void>intermediateEditWorkout( IntermediateWorkoutModel workout, index)async{
  final workoutDb = await Hive.openBox('intermediate_workout_db');
  await workoutDb.putAt(index, workout);
  intermediateGetAllWorkout();
}



//For Advanced
ValueNotifier<List<AdvancedWorkoutModel>>advancedWorkoutList=ValueNotifier([]);
Future<void>advancedWorkoutAdd(AdvancedWorkoutModel value)async{
  final workoutDb = await Hive.openBox('advance_workout_db');
  print("Box is opened");
  await workoutDb.add(value);
  print("item is opened");

  // value.id = id;
  advancedWorkoutList.value.add(value);
  advancedWorkoutList.notifyListeners();
}

Future<void>advancedGetAllWorkout()async{
  final workoutDb = await Hive.openBox('advance_workout_db');
  advancedWorkoutList.value.clear();
  advancedWorkoutList.value.addAll(workoutDb.values.cast<AdvancedWorkoutModel>());
  advancedWorkoutList.notifyListeners();
}

//edit for advanced
Future<void>advancedEditWorkout( AdvancedWorkoutModel workout, index )async{
  final workoutDb = await Hive.openBox('advance_workout_db');
  await workoutDb.putAt(index, workout);
  advancedGetAllWorkout();
}

//delete for advanced
Future<void>advancedDeleteWorkout(int index)async{
  final workoutDb = await Hive.openBox('advance_workout_db');
  workoutDb.deleteAt(index);
}









//profile
Future<void> addProfile(ProfileModel profile) async {
  final box = await Hive.openBox<ProfileModel>('profile_db');
  await box.put(1, profile); 
}


Future<ProfileModel?> getProfile(int key) async {
  final box = await Hive.openBox<ProfileModel>('profile_db');
  return box.get(key); 
}

// Update profile
Future<void> updateProfile(int key, ProfileModel profile) async {
  final box = await Hive.openBox<ProfileModel>('profile_db');
  await box.put(key, profile); 
}

// Delete Profile
Future<void> deleteProfile(int key) async {
  final box = await Hive.openBox<ProfileModel>('profile_db');
  await box.delete(key); 
}
