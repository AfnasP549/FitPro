import 'package:fitpro/db_functions/database_db.dart';
import 'package:fitpro/models/beginner_model/beginnerWorkout_model.dart';
import 'package:fitpro/screens/admin/adminhome.dart';
import 'package:fitpro/widget/colors.dart';
import 'package:fitpro/widget/customTextFormField.dart';
import 'package:fitpro/widget/custom_appbar.dart';
import 'package:fitpro/widget/validation.dart';
import 'package:flutter/material.dart';

class BeginnerAdd extends StatelessWidget {
  BeginnerAdd({super.key, required workoutModel});

  final formKey = GlobalKey<FormState>();
  final _urlController = TextEditingController();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _durationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.Black,
      appBar: customAppBar(context, text1: 'BEGINNER', back: true),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextFormField(
                            labelText: 'Url',
                            controller: _urlController,
                            validator: (value) {
                              return validatorFunction(url: value);
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(
                            labelText: 'Name',
                            controller: _nameController,
                            validator: (value) {
                              return validatorFunction(name: value);
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(
                            maxLines: 3,
                            labelText: 'Description',
                            controller: _descriptionController,
                            validator: (value) {
                              return validatorFunction(description: value);
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(
                            labelText: 'Duration',
                            controller: _durationController,
                            keyboardTYpe: TextInputType.number,
                            validator: (value) {
                              return validatorFunction(duration: value);
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                addWorkOutTODB(context);
                                Navigator.pop(context);
                              }
                            },
                            child: const Text(
                              'ADD',
                              style: TextStyle(
                                color: MyColors.DBlack,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addWorkOutTODB(BuildContext context) async {
    try {
      final url = _urlController.text.trim();
      final name = _nameController.text.trim();
      final des = _descriptionController.text.trim();
      final dur = _durationController.text.trim();

      final data = BeginnerWorkoutModel(
          url: url, name: name, description: des, duration: dur);
      beginnerWorkoutAdd(data);
      showSnackBar(context, 'Workout added successfully!');
    } catch (e) {
      debugPrint('Error to add workout$e');
    }
  }
}
