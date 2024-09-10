

import 'dart:developer';

import 'package:fitproo/models/diet_tracker_model/diet_tracker_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<DietTrackerModel>>dietTrackerList = ValueNotifier([]);
 
Future<void>addDietTracker(DietTrackerModel value,)async{
  final dietTracker = await Hive.openBox<DietTrackerModel>('diet_tracker_db');
   await dietTracker.put(value.category,value);
   await dietTracker.close();
   getDietTracker();
}

Future<void>getDietTracker()async{
  final dietTracker = await Hive.openBox<DietTrackerModel>('diet_tracker_db');
  log(dietTracker.length.toString());

  dietTrackerList.value.clear();
  dietTrackerList.value.addAll(dietTracker.values.cast<DietTrackerModel>());
  dietTrackerList.notifyListeners();
  dietTracker.close();

}