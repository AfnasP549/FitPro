import 'package:fitpro/models/advanced_model/advancedWorkout_model.dart';
import 'package:fitpro/models/beginner_model/beginnerWorkout_model.dart';
import 'package:fitpro/models/diet_tracker_model/diet_tracker_model.dart';
import 'package:fitpro/models/history_model/history_model.dart';
import 'package:fitpro/models/intermediate_model/intermediateWorkout_model.dart';
import 'package:fitpro/models/profile_model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:fitpro/screens/user/splash_screen.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  if(!Hive.isAdapterRegistered(BeginnerWorkoutModelAdapter().typeId)){
    Hive.registerAdapter(BeginnerWorkoutModelAdapter());
  }
   if(!Hive.isAdapterRegistered(IntermediateWorkoutModelAdapter().typeId)){
    Hive.registerAdapter(IntermediateWorkoutModelAdapter());
   }
 
  if(!Hive.isAdapterRegistered(AdvancedWorkoutModelAdapter().typeId)){
    Hive.registerAdapter(AdvancedWorkoutModelAdapter());
  }
  if(!Hive.isAdapterRegistered(ProfileModelAdapter().typeId)){
    Hive.registerAdapter(ProfileModelAdapter());
  }
  if(!Hive.isAdapterRegistered(WorkoutHistoryModelAdapter().typeId)){
    Hive.registerAdapter(WorkoutHistoryModelAdapter());
  }
  if(!Hive.isAdapterRegistered(DietTrackerModelAdapter().typeId)){
    Hive.registerAdapter(DietTrackerModelAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FitPro',
      theme: ThemeData(
        splashColor: Colors.white,
      
       ),
      home: const Splashscreen(),
    );
  }
}
