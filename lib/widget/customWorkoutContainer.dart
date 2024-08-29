import 'dart:ui' show FontWeight;

import 'package:fitpro/widget/colors.dart';
import 'package:flutter/material.dart';

class CustomWorkoutContainer extends StatelessWidget {
  final String imagePath;
  final String title;
  final String textButton;
  final Widget navigate;
  final bool imageRight; 
  const CustomWorkoutContainer({
    super.key,
    required this.imagePath,
    required this.title,
    required this.textButton,
    required this.navigate,
    this.imageRight = false, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      decoration: BoxDecoration(
        color: MyColors.DBlack,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: imageRight
            ? [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 35),
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: MyColors.White,
                          ),
                        ),
                      ),
                      SizedBox(width: 95,height: 38,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => navigate,
                              ),
                            );
                          },
                          child: Text(
                            textButton,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: MyColors.DBlack,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  imagePath,
                  height: 200,
                  width: 200,
                ),
              ]
            : [
                Image.asset(
                  imagePath,
                  height: 200,
                  width: 200,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: MyColors.White,
                          ),
                        ),
                      ),
                      SizedBox(width: 95,height: 38,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => navigate,
                              ),
                            );
                          },
                          child: Text(
                            textButton,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: MyColors.DBlack,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
      ),
    );
  }
}
