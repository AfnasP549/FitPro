import 'package:fitpro/db_functions/database_db.dart';
import 'package:fitpro/models/advanced_model/advancedWorkout_model.dart';
import 'package:fitpro/screens/admin/adminhome.dart';
import 'package:fitpro/widget/colors.dart';
import 'package:fitpro/widget/customTextFormField.dart';
import 'package:fitpro/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class AdvancedEdit extends StatefulWidget {
  const AdvancedEdit(
      {super.key, required this.index, required this.advancedWorkout});
  final int index;
  final AdvancedWorkoutModel advancedWorkout;
  @override
  State<AdvancedEdit> createState() => _AdminAdvancedEditState();
}

class _AdminAdvancedEditState extends State<AdvancedEdit> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _urlController;
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _durationController;

  @override
  void initState() {
    super.initState();
    _urlController = TextEditingController(text: widget.advancedWorkout.url);
    _nameController = TextEditingController(text: widget.advancedWorkout.name);
    _descriptionController =
        TextEditingController(text: widget.advancedWorkout.description);
    _durationController =
        TextEditingController(text: widget.advancedWorkout.duration);
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
      appBar: customAppBar(context, text1: 'ADVANCED', back: true),
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
                        return 'Please enter your url';
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
                        return 'Please enter your name';
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
                        return 'Please enter your Description';
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
                        return 'Please enter your Duration';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.White,
                    ),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        final workout = AdvancedWorkoutModel(
                            url: _urlController.text,
                            name: _nameController.text,
                            description: _descriptionController.text,
                            duration: _durationController.text);
                        advancedEditWorkout(workout, widget.index);
                        Navigator.pop(context);
                      }
                      showSnackBar(context, 'Workout edited successfully!');
                    },
                    child: const Text(
                      'UPDATE',
                      style: TextStyle(
                          color: MyColors.DBlack, fontWeight: FontWeight.bold),
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
