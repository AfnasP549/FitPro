import 'dart:io';
import 'package:fitpro/db_functions/database_db.dart';
import 'package:fitpro/models/profile_model/profile_model.dart';
import 'package:fitpro/widget/colors.dart';
import 'package:fitpro/widget/customTextFormField.dart';
import 'package:fitpro/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({
    super.key,
    required this.image,
    required this.name,
    required this.age,
    required this.gender,
    required this.height,
    required this.weight,
  });

  final String name;
  final String age;
  final String gender;
  final String height;
  final String weight;
  final String image;
  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _genderController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  String? _image;

  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = pickedImage.path;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.name;
    _ageController.text = widget.age;
    _genderController.text = widget.gender;
    _heightController.text = widget.height;
    _weightController.text = widget.weight;
    _image = widget.image;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _genderController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      final profile = ProfileModel(
        image: _image ?? '',
        name: _nameController.text,
        age: _ageController.text,
        gender: _genderController.text,
        height: _heightController.text,
        weight: _weightController.text,
      );

      profileDb(profile);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.Black,
      appBar: customAppBar(context, text1: 'Edit', back: true),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: _pickImage,
                      child: CircleAvatar(
                        radius: 80,
                        backgroundImage:
                            _image != null ? FileImage(File(_image!)) : null,
                        child: _image == null
                            ? const Icon(Icons.add_a_photo, size: 50)
                            : null,
                      ),
                    ),
                    const SizedBox(height: 50),
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
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      labelText: 'Age',
                      controller: _ageController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your age';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      labelText: 'Gender',
                      controller: _genderController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your gender';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      labelText: 'Height',
                      controller: _heightController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your height';
                        }
                        return null;
                      },
                      keyboardTYpe: TextInputType.number,
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      labelText: 'Weight',
                      controller: _weightController,
                      keyboardTYpe: TextInputType.number,
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return 'Please enter your weight';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed:
                          _saveProfile, 
                      child: const Text('Update'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
