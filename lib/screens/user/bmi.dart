import 'dart:developer';
import 'dart:io';

import 'package:fitpro/db_functions/diet_tracker_db.dart';
import 'package:fitpro/models/diet_tracker_model/diet_tracker_model.dart';
import 'package:fitpro/widget/colors.dart';
import 'package:fitpro/widget/customTextFormField.dart';
import 'package:fitpro/widget/custom_appbar.dart';
import 'package:fitpro/widget/endDrawer.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Bmi extends StatefulWidget {
  const Bmi({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BMICalculatorPageState createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<Bmi> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double _bmi = 0;
  String _bmiCategory = '';

  void _calculateBMI() {
     final FocusScopeNode currentScope = FocusScope.of(context);
        if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
    if (_formKey.currentState!.validate()) {
      double height = double.tryParse(_heightController.text) ?? 0;
      double weight = double.tryParse(_weightController.text) ?? 0;

      height = height / 100;

      if (height > 0) {
        _bmi = weight / (height * height);
        _bmiCategory = _getBMICategory(_bmi);
      }
      setState(() {});
    }
  }

  DietTrackerModel? dietObj;

  String _getBMICategory(double bmi) {
    if (bmi < 18.5) {
      dietObj = dietTrackDB('underWeight');
      return 'UNDER WEIGHT';
    } else if (bmi < 24.9) {
      dietTrackDB('normalWeight');
      return 'NORMAL WEIGHT';
    } else if (bmi < 29.9) {
      dietTrackDB('overWeight');
      return 'OVER WEIGHT';
    } else {
      dietTrackDB('obesity');
      return 'OBESITY';
    }
  }

  Color _getBMICategoryColor(String category) {
    switch (category) {
      case 'UNDER WEIGHT':
        return MyColors.Yellow;
      case 'NORMAL WEIGHT':
        return MyColors.Green;
      case 'OVER WEIGHT':
        return MyColors.LOrange;
      case 'OBESITY':
        return MyColors.DRed;
      default:
        return MyColors.White;
    }
  }

  @override
  void initState() {
    getDietTracker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.Black,
      appBar: customAppBar(
        context,
        text1: 'Bmi',
        icons: FontAwesomeIcons.bars,
      ),
      endDrawer: const EndDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: MyColors.Black,
              ),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 200,
                            viewportFraction: 1.0,
                            autoPlay: true,
                          ),
                          items: [
                            'images/Bmi2.jpg',
                            'images/Bmi3.jpg',
                            'images/Bmi1.jpg',
                          ]
                              .map((item) => Container(
                                    width: double.infinity,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(item),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ))
                              .toList(),
                        ),
                        const SizedBox(height: 50),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              CustomTextFormField(
                                labelText: 'Height (cm)',
                                controller: _heightController,
                                keyboardTYpe: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your height';
                                  } else if (value.length < 2) {
                                    return 'Please enter your height';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              CustomTextFormField(
                                labelText: 'Weight (Kg)',
                                controller: _weightController,
                                keyboardTYpe: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your weight';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: _calculateBMI,
                                child: const Text(
                                  'Calculate BMI',
                                  style: TextStyle(
                                    color: MyColors.Black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: MyColors.DBlack,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          'BMI: ${_bmi.toStringAsFixed(2)}',
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: MyColors.White,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'Category:',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: MyColors.White,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                              _bmiCategory,
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: _getBMICategoryColor(
                                                    _bmiCategory),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            dietObj != null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: MyColors.DBlack,
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'DIET TRACK',
                            style: TextStyle(
                              color: MyColors.White,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                            Text(
                            dietObj!.description,
                            style: const TextStyle(
                              color: MyColors.White,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Image.file(File(dietObj!.image))
                        ],
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}

DietTrackerModel dietTrackDB(String cate) {
  log(dietTrackerList.value.length.toString());
  try {
    final diet = dietTrackerList.value.firstWhere(
      (element) => element.category == cate,
    );
    return diet;
  } on Exception catch (e) {
    log(e.toString());
    rethrow;
  }
}
