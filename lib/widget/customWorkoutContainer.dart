// ignore_for_file: must_be_immutable

import 'dart:ui' show FontWeight;

import 'package:fitpro/widget/colors.dart';
import 'package:flutter/material.dart';

class CustomWorkoutContainer extends StatelessWidget {
  final String imagePath;
  final String textButton;
  final Widget navigate;
  bool buttonRight= true;

   CustomWorkoutContainer({
    super.key,
    required this.imagePath,
    required this.textButton,
    required this.navigate,
    required this.buttonRight,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 230,
      decoration: BoxDecoration(
          color: MyColors.DBlack,
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          )),
      child: Stack(
        children:   
         [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: buttonRight ? const  EdgeInsets.only(left: 190,top: 140): const EdgeInsets.only(left: 20,top: 135),
                child: Container(
                  height: 35,
                  width: 80,
                  decoration: BoxDecoration(
                    color: MyColors.Grey,
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>navigate));
                    },
                    child: const Text('START',style: TextStyle(
                      color: MyColors.White,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                ),
              ),
            ],
          )
        ]
        
      ),
      
    );
  }
}
