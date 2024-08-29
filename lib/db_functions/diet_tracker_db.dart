

import 'package:fitpro/models/diet_tracker_model/diet_tracker_model.dart';
import 'package:fitpro/screens/admin/diet_tracker/diet_tracker.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<DietTrackerModel>>dietTrackerList = ValueNotifier([]);
 
Future<void>addDietTracker(DietTrackerModel value)async{
  final dietTracker = await Hive.openBox<DietTrackerModel>('diet_tracker_db');
   await dietTracker.add(value);
   await dietTracker.close();
   getDietTracker();
}

Future<void>getDietTracker()async{
  final dietTracker = await Hive.openBox('diet_tracker_db');
  dietTrackerList.value.clear();
  dietTrackerList.value.addAll(dietTracker.values.cast<DietTrackerModel>());
  dietTrackerList.notifyListeners();
  dietTracker.close();

}