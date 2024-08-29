import 'package:fitpro/db_functions/database_db.dart';
import 'package:fitpro/models/intermediate_model/intermediateWorkout_model.dart';
import 'package:fitpro/screens/admin/adminhome.dart';
import 'package:fitpro/widget/colors.dart';
import 'package:fitpro/widget/customTextFormField.dart';
import 'package:fitpro/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class IntermediateAdd extends StatelessWidget {
  IntermediateAdd({super.key, required workoutModel});

  final formKey = GlobalKey<FormState>();
  final _urlController = TextEditingController();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _durationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.Black,
      appBar: customAppBar(context, text1: 'INTERMEDIATE', back: true),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
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
                          if (value == null || value.isEmpty) {
                            return 'Url Needed';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        labelText: 'Name',
                        controller: _nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Name Needed';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        labelText: 'Description',
                        controller: _descriptionController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Description Needed';
                          }
                          return null;
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
                          if (value == null || value.isEmpty) {
                            return 'Duration Needed';
                          }
                          return null;
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
                            ),
                          ))
                    ],
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

      final data = IntermediateWorkoutModel(
          url: url, name: name, description: des, duration: dur);
      intermediateWorkoutAdd(data);
      showSnackBar(context, 'Workout added successfully!');
    } catch (e) {
      debugPrint('Error to add workout$e');
    }
  }
}
