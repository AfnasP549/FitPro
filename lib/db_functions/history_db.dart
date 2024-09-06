import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/history_model/history_model.dart';

ValueNotifier<List<WorkoutHistoryModel>> historyNotifier = ValueNotifier([]);

class HistoryDbMethods {
  Future<void> getAllHistory() async {
    final historyDb = await Hive.openBox<WorkoutHistoryModel>('history_db');
    log(historyDb.length.toString());
    historyNotifier.value.clear();
     historyNotifier.value.addAll(historyDb.values.cast<WorkoutHistoryModel>());
    historyNotifier.notifyListeners();
    await historyDb.close();
  }

  Future<void> addHistory(WorkoutHistoryModel history)async {
  final historyDb = await Hive.openBox<WorkoutHistoryModel>('history_db');
 await historyDb.add(history);
   await historyDb.close();
  await getAllHistory();
  }
}

