import 'package:fitpro/db_functions/database_db.dart';
import 'package:fitpro/models/intermediate_model/intermediateWorkout_model.dart';
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
      appBar: AppBar(
        title: const Text('INTERMEDIATE ADD'),
      ),
      body: Padding(
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
                    TextFormField(
                      controller: _urlController,
                      decoration: const InputDecoration(
                        labelText: 'Url',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return 'Url Needed';
                        }
                        return null;
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
                        if(value == null || value.isEmpty){
                          return 'name Needed';
                        }
                        return null;
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
                        if(value == null || value.isEmpty){
                          return 'Description Needed';
                        }
                        return null;
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
                        if(value == null || value.isEmpty){
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
                          if(formKey.currentState!.validate()){
                            addWorkOutTODB();
                            Navigator.pop(context);
                          }
                        },
                        child: const Text('Add'))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future<void> addWorkOutTODB() async {
    try{
      final url = _urlController.text.trim();
      final name = _nameController.text.trim();
      final des = _descriptionController.text.trim();
      final dur = _durationController.text.trim();

      final data = IntermediateWorkoutModel(
        url: url, 
        name: name, 
        description: des, 
        duration: dur
        );
        intermediateWorkoutAdd(data);
    }
    catch(e){
      debugPrint('Error to add workout$e');
    }
  }
}
