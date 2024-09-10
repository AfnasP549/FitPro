import 'package:fitproo/db_functions/database_db.dart';
import 'package:fitproo/models/beginner_model/beginnerWorkout_model.dart';
import 'package:fitproo/screens/admin/adminhome.dart';
import 'package:fitproo/widget/colors.dart';
import 'package:fitproo/widget/customTextFormField.dart';
import 'package:fitproo/widget/custom_appbar.dart';
import 'package:fitproo/widget/validation.dart';
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
                      if (_formKey.currentState?.validate() ?? false) {
                        final workout = BeginnerWorkoutModel(
                          url: _urlController.text,
                          name: _nameController.text,
                          description: _descriptionController.text,
                          duration: _durationController.text,
                        );
                        beginnerEditWorkout(workout, widget.index);

                        showSnackBar(context, 'Workout edited successfully!');

                        Navigator.pop(context);
                      }
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
