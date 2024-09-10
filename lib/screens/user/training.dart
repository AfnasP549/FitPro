// ignore_for_file: file_names

import 'package:fitproo/screens/user/advanced/advanced.dart';
import 'package:fitproo/screens/user/beginner/beginner.dart';
import 'package:fitproo/screens/user/intermediate/intermediate.dart';
import 'package:fitproo/widget/colors.dart';
import 'package:fitproo/widget/custom_appbar.dart';
import 'package:fitproo/widget/endDrawer.dart';
import 'package:fitproo/widget/customWorkoutContainer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Training extends StatefulWidget {
  const Training({super.key});

  @override
  State<Training> createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.Black,
      appBar: customAppBar(
        context,
        text1: 'Training',
        icons: FontAwesomeIcons.bars,
        back: true,
      ),
      endDrawer: const EndDrawer(),
      body:  Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              CustomWorkoutContainer(
                imagePath: 'images/BEGINNER1.png',
                textButton: 'START',
                navigate: const Beginner(),
                buttonRight: true,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomWorkoutContainer(
                imagePath: 'images/INTERMEDIATE2.png',
                textButton: 'START',
                navigate: const Intermediate(),
                buttonRight: false,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomWorkoutContainer(
                imagePath:  'images/ADVANCED3.png',
                textButton: 'START',
                navigate: const Advanced(),
                buttonRight: true,

              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
