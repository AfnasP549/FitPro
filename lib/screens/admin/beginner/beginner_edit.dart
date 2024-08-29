import 'package:fitpro/db_functions/database_db.dart';
import 'package:fitpro/models/beginner_model/beginnerWorkout_model.dart';
import 'package:fitpro/screens/admin/adminhome.dart';
import 'package:fitpro/widget/colors.dart';
import 'package:fitpro/widget/customTextFormField.dart';
import 'package:fitpro/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class BeginnerEdit extends StatefulWidget {
  const BeginnerEdit(
      {super.key, required this.index, required this.beginnerWorkout});
  final int index;
  final BeginnerWorkoutModel beginnerWorkout;
  @override
  State<BeginnerEdit> createState() => _AdminBeginnerEditState();
}

class _AdminBeginnerEditState extends State<BeginnerEdit> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _urlController;
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _durationController;

  @override
  void initState() {
    super.initState();
    _urlController = TextEditingController(text: widget.beginnerWorkout.url);
    _nameController = TextEditingController(text: widget.beginnerWorkout.name);
    _descriptionController =
        TextEditingController(text: widget.beginnerWorkout.description);
    _durationController =
        TextEditingController(text: widget.beginnerWorkout.duration);
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
      appBar: customAppBar(context, text1: 'BEGINNER', back: true),
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
                      if (_formKey.currentState?.validate() ?? false) {
                        final workout = BeginnerWorkoutModel(
                            url: _urlController.text,
                            name: _nameController.text,
                            description: _descriptionController.text,
                            duration: _durationController.text);
                        beginnerEditWorkout(workout, widget.index);
                        Navigator.pop(context);
                      }
                      showSnackBar(context, 'Workout edited successfully!');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.White,
                    ),
                    child: const Text(
                      'UPDATE',
                      style: TextStyle(
                        color: MyColors.DBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
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
