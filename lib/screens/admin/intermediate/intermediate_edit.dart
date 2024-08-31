import 'package:fitpro/db_functions/database_db.dart';
import 'package:fitpro/models/intermediate_model/intermediateWorkout_model.dart';
import 'package:fitpro/screens/admin/adminhome.dart';
import 'package:fitpro/widget/colors.dart';
import 'package:fitpro/widget/customTextFormField.dart';
import 'package:fitpro/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class IntermediateEdit extends StatefulWidget {
  const IntermediateEdit(
      {super.key, required this.index, required this.intermediateWorkout});
  final int index;
  final IntermediateWorkoutModel intermediateWorkout;
  @override
  State<IntermediateEdit> createState() => _IntermediateEditState();
}

class _IntermediateEditState extends State<IntermediateEdit> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _urlController;
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _durationController;

  @override
  void initState() {
    super.initState();
    _urlController =
        TextEditingController(text: widget.intermediateWorkout.url);
    _nameController =
        TextEditingController(text: widget.intermediateWorkout.name);
    _descriptionController =
        TextEditingController(text: widget.intermediateWorkout.description);
    _durationController =
        TextEditingController(text: widget.intermediateWorkout.duration);
  }

  @override
  void dispose() {
    _urlController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    _durationController.dispose();
    super.dispose();
  }

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
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextFormField(
                    labelText: 'Url',
                    controller: _urlController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter url';
                      }
                      const urlPattern =
                          r'^(http|https):\/\/[\w\-_]+(\.[\w\-_]+)+[/#?]?.*$';
                      final result = RegExp(urlPattern, caseSensitive: false)
                          .hasMatch(value);
                      if (!result) {
                        return 'Please enter a valid URL';
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
                        return 'Please enter your Name';
                      }
                      String cleanedValue =
                          value.trim().replaceAll(RegExp(r'\s+'), ' ');
                      if (RegExp(r'[0-9]').hasMatch(cleanedValue)) {
                        return 'Name should not contain numbers';
                      }
                      if (RegExp(r'[!@#\$%^&*(),.?":{}|<>]')
                          .hasMatch(cleanedValue)) {
                        return 'Name should not contain special characters';
                      }
                      if (cleanedValue != value) {
                        return 'Please avoid continuous spaces';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    maxLines: true,
                    labelText: 'Description',
                    controller: _descriptionController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your description';
                      }

                      String cleanedValue =
                          value.trim().replaceAll(RegExp(r'\s+'), ' ');

                      if (cleanedValue.length < 10) {
                        return 'Description must be at least 10 characters long';
                      }

                      if (cleanedValue != value) {
                        return 'Please avoid continuous spaces';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    labelText: 'Duration in Seconds',
                    controller: _durationController,
                    keyboardTYpe: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your duration';
                      }
                      if (RegExp(r'^[0-9]+$').hasMatch(value) == false) {
                        return 'Please enter numeric characters only';
                      }
                      if (int.tryParse(value) == 0) {
                        return 'Duration cannot be zero';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        final workout = IntermediateWorkoutModel(
                          url: _urlController.text,
                          name: _nameController.text,
                          description: _descriptionController.text,
                          duration: _durationController.text,
                        );
                        intermediateEditWorkout(workout, widget.index);
                        Navigator.pop(context);
                      }
                      showSnackBar(context, 'Workout edited successfully!');
                    },
                    child: const Text(
                      'UPDATE',
                      style: TextStyle(
                        color: MyColors.DBlack,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


