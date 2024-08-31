// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api



import 'package:fitpro/db_functions/diet_tracker_db.dart';
import 'package:fitpro/models/diet_tracker_model/diet_tracker_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:fitpro/widget/colors.dart';
import 'package:fitpro/widget/custom_appbar.dart';

class DietTrackerAdd extends StatefulWidget {
  final String category;
  final DietTrackerModel? dietTrackerModel;
  const DietTrackerAdd(
      {super.key, required this.category,  this.dietTrackerModel});

  @override
  _DietTrackerAddState createState() => _DietTrackerAddState();
}

class _DietTrackerAddState extends State<DietTrackerAdd> {
  String? _imageBytes;
  File? img;
  final _descriptionController = TextEditingController();
  late DietTrackerModel newDiet;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        img = File(pickedFile.path);
        _imageBytes = pickedFile.path;
      }
    });
  }

  Future<void> _addDietToDB() async {
    if (img == null || _descriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select an image and enter a description'),
        ),
      );
      return;
    }

    final imageBytes = _imageBytes;
    newDiet = DietTrackerModel(
      image: imageBytes!,
      description: _descriptionController.text,
      category: widget.category,
    );
    await addDietTracker(newDiet);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Diet added successfully'),
      ),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.dietTrackerModel != null) {
      newDiet = widget.dietTrackerModel!;
      img = File(newDiet.image);
      _descriptionController.text = newDiet.description;
      _imageBytes=newDiet.image;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.Black,
      appBar: customAppBar(context, text1: 'Add', back: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Image',
                style: TextStyle(fontSize: 16, color: MyColors.Grey),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  _pickImage(ImageSource.gallery);
                },
                child: Container(
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: MyColors.Grey),
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey[200],
                  ),
                  child: img == null
                      ? const Center(
                          child: Text(
                            'Tap to select an image',
                            style:
                                TextStyle(fontSize: 16, color: MyColors.Grey),
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.file(
                            img!,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Description',
                style: TextStyle(fontSize: 16, color: MyColors.Grey),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  Focus.of(context).unfocus();
                },
                child: TextFormField(
                  controller: _descriptionController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Enter description...',
                    hintStyle: const TextStyle(color: MyColors.Grey),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: _addDietToDB,
                  child: const Text('Add Diet'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
