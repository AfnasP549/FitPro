import 'dart:io';
import 'package:fitproo/db_functions/database_db.dart';
import 'package:fitproo/models/profile_model/profile_model.dart';
import 'package:fitproo/screens/user/profile_edit.dart';
import 'package:fitproo/widget/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile extends StatefulWidget {
  const Profile({
    super.key,
  });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ProfileModel? profile;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  void _loadProfile() async {
    profile = await getProfileDb();
    if (profile == null) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (ctx) => const ProfileEdit(
                image: '',
                name: '',
                age: '',
                gender: '',
                height: '',
                weight: '',
              )));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.Black,
      appBar: AppBar(
        backgroundColor: MyColors.Black,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);

            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: MyColors.White,
            )),
        title: const Text(
          'Profile',
          style: TextStyle(color: MyColors.White, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: profile != null
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => ProfileEdit(
                            image: profile!.image.toString(),
                            name: profile!.name.toString(),
                            age: profile!.age.toString(),
                            gender: profile!.gender.toString(),
                            height: profile!.height.toString(),
                            weight: profile!.weight.toString(),
                          ),
                        ),
                     ).then((_) => _loadProfile());
                    }
                  : null,
              icon: const Icon(FontAwesomeIcons.penToSquare,
                  color: MyColors.Orange),
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: profile == null
              ? const CircularProgressIndicator()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 80,
                          backgroundImage: profile!.image != null &&
                                  profile!.image!.isNotEmpty
                              ? FileImage(File(profile!.image!))
                              : null,
                          child:
                              profile!.image == null || profile!.image!.isEmpty
                                  ? const Icon(Icons.person,
                                      size: 50, color: MyColors.Grey)
                                  : null,
                        ),
                      ),
                      const SizedBox(height: 50),
                      _buildProfileField('Name:', profile!.name),
                      const SizedBox(height: 10),
                      _buildProfileField('Age:', profile!.age),
                      const SizedBox(height: 10),
                      _buildProfileField('Gender:', profile!.gender),
                      const SizedBox(height: 10),
                      _buildProfileField('Height:', profile!.height),
                      const SizedBox(height: 10),
                      _buildProfileField('Weight:', profile!.weight),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildProfileField(String label, String? value) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: MyColors.Grey,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: MyColors.White,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              value ?? 'N/A',
              style: const TextStyle(
                color: MyColors.White,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
