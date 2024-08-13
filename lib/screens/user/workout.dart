import 'dart:async'; // Import for Timer
import 'package:fitpro/models/advanced_model/advancedWorkout_model.dart';
import 'package:fitpro/models/beginner_model/beginnerWorkout_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Workout extends StatefulWidget {
   final List<dynamic> workoutList;

  const Workout({super.key, required this.workoutList});

  @override
  State<Workout> createState() => _ExcerciseDetailsState();
}

class _ExcerciseDetailsState extends State<Workout> {
  late YoutubePlayerController _youtubeVideoController;
  int i = 0;
  late Timer _timer;
  int _start = 30;
  bool _isPaused = false;

  @override
  void initState() {
    String youtubeVideoId = YoutubePlayer.convertUrlToId(widget.workoutList[i].url) ?? '';
    _youtubeVideoController = YoutubePlayerController(
        initialVideoId: youtubeVideoId,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: true,
          loop: true,
          hideThumbnail: true,
        ));
    _startTimer();


    super.initState();
    
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_isPaused) return;

      if (_start == 0) {
        timer.cancel();
        _nextWorkout(); // Automatically go to the next workout
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _youtubeVideoController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _nextWorkout() {
    setState(() {
      if (i < widget.workoutList.length - 1) {
        i++;
        _updateVideo();
        _resetTimer();
      } else {
        // Handle when the workout list ends, e.g., show a completion message or navigate to a different screen
      }
    });
  }

  void _prevWorkout() {
    setState(() {
      if (i > 0) {
        i--;
        _updateVideo();
        _resetTimer();
      }
    });
  }

  void _updateVideo() {
    String youtubeVideoId = YoutubePlayer.convertUrlToId(widget.workoutList[i].url) ?? '';
    _youtubeVideoController.load(youtubeVideoId);
  }

  void _resetTimer() {
    _timer.cancel();
    _start = 30;
    _startTimer();
  }

  void _togglePause() {
    setState(() {
      _isPaused = !_isPaused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 32, 32),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 500,
                child: YoutubePlayer(
                  controller: _youtubeVideoController,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                widget.workoutList[i].name,
                style: const TextStyle(
                    color: Colors.amber,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '00:$_start',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: _togglePause,
                child: Icon(
                  _isPaused ? FontAwesomeIcons.play : FontAwesomeIcons.pause,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: _prevWorkout,
                      child: const Icon(FontAwesomeIcons.arrowLeftLong)),
                  ElevatedButton(
                      onPressed: _nextWorkout,
                      child: const Icon(FontAwesomeIcons.arrowRightLong)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
