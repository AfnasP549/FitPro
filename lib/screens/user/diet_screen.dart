import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitpro/widget/colors.dart';
import 'package:fitpro/widget/customTextFormField.dart';
import 'package:fitpro/widget/custom_appbar.dart';
import 'package:fitpro/widget/endDrawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FoodModel {
  final String name;
  final int calories;
  final double protein;
  final double fat;
  final double carbohydrates;

  FoodModel({
    required this.name,
    required this.calories,
    required this.protein,
    required this.fat,
    required this.carbohydrates,
  });
}

class FoodRepository {
  static final List<FoodModel> foods = [
    FoodModel(
        name: 'Whole Wheat Bread',
        calories: 80,
        protein: 4.0,
        fat: 1.0,
        carbohydrates: 15.0),
    FoodModel(
        name: 'Wheat Pasta',
        calories: 150,
        protein: 5.0,
        fat: 1.0,
        carbohydrates: 30.0),
    FoodModel(
        name: 'Brown Rice',
        calories: 110,
        protein: 2.5,
        fat: 1.0,
        carbohydrates: 23.0),
    FoodModel(
        name: 'White Rice',
        calories: 130,
        protein: 2.0,
        fat: 0.3,
        carbohydrates: 28.0),
    FoodModel(
        name: 'Chicken Breast',
        calories: 165,
        protein: 31.0,
        fat: 3.6,
        carbohydrates: 0.0),
    FoodModel(
        name: 'Eggs',
        calories: 155,
        protein: 13.0,
        fat: 11.0,
        carbohydrates: 1.0),
  ];
}

class DietScreen extends StatefulWidget {
  const DietScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DietPageState createState() => _DietPageState();
}

class _DietPageState extends State<DietScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _quantityController = TextEditingController();
  FoodModel? _selectedFood;

  final List<FoodModel> _loggedMeals = [];
  double _totalCalories = 0;

  void _logMeal() {
    if (_formKey.currentState!.validate() && _selectedFood != null) {
      final quantity = double.tryParse(_quantityController.text) ?? 0;
      setState(() {
        _loggedMeals.add(_selectedFood!);
        _totalCalories += _selectedFood!.calories * (quantity / 100);
        _quantityController.clear();
        _selectedFood = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.Black,
      appBar: customAppBar(
        context,
        text1: 'Diet Tracker',
        icons: FontAwesomeIcons.bars,
      ),
      endDrawer: const EndDrawer(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200,
                      viewportFraction: 1.0,
                      autoPlay: true,
                    ),
                    items: [
                      'images/Diet4.jpg',
                      'images/Diet3.jpg',
                      'images/Diet2.jpg',
                      'images/Diet1.jpg',
                    ]
                        .map((item) => Container(
                              width: double.infinity,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
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
                  const SizedBox(
                    height: 50,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        DropdownButtonFormField<FoodModel>(
                          value: _selectedFood,
                          items: FoodRepository.foods.map((food) {
                            return DropdownMenuItem<FoodModel>(
                              value: food,
                              child: Text(food.name,
                                  style:
                                      const TextStyle(color: MyColors.White)),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedFood = value;
                            });
                          },
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: MyColors.Black,
                            labelText: 'Select Food Item',
                            labelStyle: TextStyle(color: MyColors.White),
                            border: OutlineInputBorder(),
                          ),
                          style: const TextStyle(color: MyColors.White),
                          dropdownColor: MyColors.Grey,
                          focusColor: Colors.white,
                          iconEnabledColor: MyColors.White,
                        ),
                        const SizedBox(height: 20),
                        CustomTextFormField(
                            labelText: "Quantity (grams)",
                            controller: _quantityController,
                            keyboardTYpe: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                              return 'Please enter your quantity';
                            }
                            return null;
                            },
                            ),

                        
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: _logMeal,
                          child: const Text(
                            'CALORIES',
                            style: TextStyle(
                                color: MyColors.DBlack,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: MyColors.White),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text('Total Calories: $_totalCalories calories',
                              style: const TextStyle(
                                  color: MyColors.White,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const SizedBox(height: 20),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _loggedMeals.length,
                    itemBuilder: (context, index) {
                      final meal = _loggedMeals[index];
                      return Container(
                        color: MyColors.DBlack,
                        child: ListTile(
                          title: Text(meal.name,
                              style: const TextStyle(color: MyColors.White)),
                          subtitle: Text(
                            'Calories: ${meal.calories} | Protein: ${meal.protein}g | Fat: ${meal.fat}g | Carbs: ${meal.carbohydrates}g',
                            style: const TextStyle(color: MyColors.White),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
