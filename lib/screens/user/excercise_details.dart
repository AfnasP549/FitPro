// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:fitproo/widget/colors.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExcerciseDetails extends StatefulWidget {
  final String url;
  final String name;
  final String description;
  const ExcerciseDetails({
    super.key,
    required this.url,
    required this.name,
    required this.description,
  });

  @override
  State<ExcerciseDetails> createState() => _ExcerciseDetailsState();
}

class _ExcerciseDetailsState extends State<ExcerciseDetails> {
  late YoutubePlayerController _youtubeVideoController;

  @override
  void initState() {
    String youtubeVideoId = YoutubePlayer.convertUrlToId(widget.url) ?? '';
    _youtubeVideoController = YoutubePlayerController(
        initialVideoId: youtubeVideoId,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: true,
          loop: true,
          hideThumbnail: true,
        ));
    super.initState();
  }

  @override
  void dispose() {
    _youtubeVideoController.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.Black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              YoutubePlayer(
                controller: _youtubeVideoController,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                widget.name,
                style: const TextStyle(
                    color: MyColors.White,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.description,
                  style: const TextStyle(
                      color: MyColors.White,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
