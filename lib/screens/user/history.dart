import 'dart:developer';

import 'package:fitproo/db_functions/history_db.dart';
import 'package:fitproo/widget/colors.dart';
import 'package:fitproo/widget/custom_appbar.dart';
import 'package:fitproo/widget/endDrawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../models/history_model/history_model.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  int _totalWorkoutTime = 0;
  final int _targetTime = 86400; // 1 day
  Map<DateTime, List<Widget>> map = {};

  @override
  void initState() {
    super.initState();
    _loadTotalWorkoutTime();
    HistoryDbMethods().getAllHistory();
  }

  Future<void> _loadTotalWorkoutTime() async {
    var box = await Hive.openBox('workout_stats');
    setState(() {
      _totalWorkoutTime = box.get('totalWorkoutTime', defaultValue: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.Black,
      appBar:
          customAppBar(context, text1: 'History', icons: FontAwesomeIcons.bars),
      endDrawer: const EndDrawer(),
      body: ValueListenableBuilder<List<WorkoutHistoryModel>>(
          valueListenable: historyNotifier,
          builder: (context, value, _) {
            log(value.length.toString());
            convertToMap(value);
            _totalWorkoutTime = calculateTime(value);
            double progress = _totalWorkoutTime / _targetTime;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  CircularPercentIndicator(
                    radius: 150.0,
                    lineWidth: 13.0,
                    animation: true,
                    percent: progress > 1 ? 1 : progress, // cap at 100%
                    center: Text(
                      _formatTime(_totalWorkoutTime),
                      style: const TextStyle(
                        color: MyColors.White,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: MyColors.Amber,
                    backgroundColor: MyColors.DBlack,
                  ),
                  const SizedBox(height: 20),
                  ...map.keys.map((e) {
                    return Column(
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(dateString(e)),
                          ),
                        ),
                        ...map[e]!,
                      ],
                    );
                  }),
                ],
              ),
            );
          }),
    );
  }

  String _formatTime(int totalSeconds) {
    int hours = totalSeconds ~/ 3600;
    int minutes = (totalSeconds % 3600) ~/ 60;
    int seconds = totalSeconds % 60;

    if (hours > 0) {
      return "$hours hours, $minutes minutes, $seconds seconds";
    } else if (minutes > 0) {
      return "$minutes minutes, $seconds seconds";
    } else {
      return "$seconds seconds";
    }
  }

  int calculateTime(List<WorkoutHistoryModel> list) {
    int total = 0;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    for (var element in list) {
      var date =
          DateTime(element.date.year, element.date.month, element.date.day);
      if (date == today) {
        total += element.duration;
      }
    }
    return total;
  }

  String dateString(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);

    if (date == today) {
      return 'Today';
    } else if (date == yesterday) {
      return 'Yesterday';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }

  void convertToMap(List<WorkoutHistoryModel> list) {
    map.clear();
    for (var element in list) {
      var date =
          DateTime(element.date.year, element.date.month, element.date.day);
      if (!map.containsKey(date)) {
        map[date] = [];
      }
      map[date]!.add(Card(
        color: MyColors.DBlack,
        child: ListTile(
          leading: Image.asset('images/ADVANCED.png'),
          title: Text(
            element.workoutName,
            style: const TextStyle(
              color: MyColors.White,
            ),
          ),
          subtitle: Text(
            dateString(element.date),
            style: const TextStyle(
              color: MyColors.White,
            ),
          ),
        ),
      ));
    }

    map = Map.fromEntries(
        map.entries.toList()..sort((a, b) => b.key.compareTo(a.key)));
  }
}
