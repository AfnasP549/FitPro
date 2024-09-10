import 'package:fitproo/db_functions/database_db.dart';
import 'package:fitproo/models/intermediate_model/intermediateWorkout_model.dart';
import 'package:fitproo/screens/admin/adminhome.dart';
import 'package:fitproo/widget/colors.dart';
import 'package:fitproo/widget/customTextFormField.dart';
import 'package:fitproo/widget/custom_appbar.dart';
import 'package:fitproo/widget/validation.dart';
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
