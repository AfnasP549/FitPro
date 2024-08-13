import 'package:fitpro/db_functions/database_db.dart';
import 'package:fitpro/models/beginner_model/beginnerWorkout_model.dart';
import 'package:flutter/material.dart';

class AdminBeginnerEdit extends StatefulWidget {
  const AdminBeginnerEdit(
      {super.key, required this.index, required this.beginnerWorkout});
  final int index;
  final BeginnerWorkoutModel beginnerWorkout;
  @override
  State<AdminBeginnerEdit> createState() => _AdminBeginnerEditState();
}

class _AdminBeginnerEditState extends State<AdminBeginnerEdit> {
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

  Future<void> _saveDetails() async {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BEGINNER EDIT'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _urlController,
                  decoration: const InputDecoration(
                    labelText: 'Url',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your url";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your name";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your description";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _durationController,
                  decoration: const InputDecoration(
                    labelText: 'Duration',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your duration";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    final workout = BeginnerWorkoutModel(
                        url: _urlController.text,
                        name: _nameController.text,
                        description: _descriptionController.text,
                        duration: _durationController.text);
                    beginnerEditWorkout(workout, widget.index);
                    Navigator.pop(context);
                  },
                  child: const Text('Save'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
