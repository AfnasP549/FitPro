import 'dart:async';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../db_functions/history_db.dart';
import '../../models/history_model/history_model.dart';

class Workout extends StatefulWidget {
  final List<dynamic> workoutList;

  const Workout({super.key, required this.workoutList});

  @override
  State<Workout> createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  YoutubePlayerController? _youtubeVideoController;
  int currentIndex = 0;
  Timer? _timer;
  int timeLeft = 0;
  bool isPaused = false;
  bool isCoolOffTime = true;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
    _startTimer(15);
  }

  void _initializeVideo() {
    String youtubeVideoId =
        YoutubePlayer.convertUrlToId(widget.workoutList[currentIndex].url) ??
            '';

    if (_youtubeVideoController != null) {
      _youtubeVideoController!.removeListener(_onPlayerStateChanged);
      _youtubeVideoController!.dispose();
    }

    _youtubeVideoController = YoutubePlayerController(
      initialVideoId: youtubeVideoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
        loop: true,
        controlsVisibleAtStart: false,
      ),
    );

    _youtubeVideoController!.addListener(_onPlayerStateChanged);
  }

  void _onPlayerStateChanged() {
    if (_youtubeVideoController!.value.playerState == PlayerState.ended) {}
  }

  void _startTimer(int duration) {
    _timer?.cancel();
    timeLeft = duration;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (isPaused) return;

      setState(() {
        if (timeLeft > 0) {
          timeLeft--;
        } else {
          _timer?.cancel();
          if (isCoolOffTime) {
            _startWorkout();
          } else {
            _completeWorkout();
          }
        }
      });
    });
  }

  void _startWorkout() {
    setState(() {
      isCoolOffTime = false;
      _startTimer(int.parse(widget.workoutList[currentIndex].duration));
    });
  }

  void _completeWorkout() {
    HistoryDbMethods()
        .addHistory(WorkoutHistoryModel(
            workoutName: widget.workoutList[currentIndex].name,
            duration: int.parse(widget.workoutList[currentIndex].duration),
            date: DateTime.now()))
        .then(
      (value) {
        if (currentIndex < widget.workoutList.length - 1) {
          setState(() {
            currentIndex++;
            _initializeVideo();
            _startTimer(15); 
            isCoolOffTime = true;
          });
        } else {
          Navigator.of(context).pop(); 
        }
      },
    );
  }

  void _prevWorkout() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
        _initializeVideo();
        _startTimer(15); 
        isCoolOffTime = true;
      });
    }
  }

  @override
  void dispose() {
    _youtubeVideoController?.removeListener(_onPlayerStateChanged);
    _youtubeVideoController?.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _togglePause() {
    setState(() {
      isPaused = !isPaused;
    });
  }

  void _skipCoolOff() {
    if (isCoolOffTime) {
      _timer?.cancel();
      _startWorkout();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 500,
              child: isCoolOffTime
                  ? Image.asset('images/Getready.png')
                  : YoutubePlayer(controller: _youtubeVideoController!),
            ),
            const SizedBox(height: 30),
            Text(
              isCoolOffTime
                  ? "COOL-OFF TIME"
                  : widget.workoutList[currentIndex].name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '00:$timeLeft',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 30),
            if (!isCoolOffTime)
              ElevatedButton(
                onPressed: _togglePause,
                child: Icon(
                  isPaused ? Icons.play_arrow : Icons.pause,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            if (isCoolOffTime)
              ElevatedButton(
                onPressed: _skipCoolOff,
                child: const Text(
                  "SKIP",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: currentIndex > 0 ? _prevWorkout : null,
                  child:
                      const Text('BACK', style: TextStyle(color: Colors.black)),
                ),
                ElevatedButton(
                  onPressed: _completeWorkout,
                  child:
                      const Text('NEXT', style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
