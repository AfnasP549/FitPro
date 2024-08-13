import 'package:fitpro/db_functions/database_db.dart';
import 'package:fitpro/models/profile_model/profile_model.dart';
import 'package:fitpro/models/beginner_model/beginnerWorkout_model.dart';
import 'package:fitpro/screens/user/profile_edit.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ProfileModel? profile; // Changed to nullable

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    try {
      final prof = await getProfile(1); // Fetch profile with key 1
      setState(() {
        profile = prof; // Handle potential null value
      });
    } catch (e) {
      // Handle error if fetching profile fails
      print('Error loading profile: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (ctx)=>ProfileEdit()));
            }, icon: Icon(Icons.edit,color: Colors.black,))
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('images/avatar.jpeg'),
              ),
              const SizedBox(height: 30,),
              Text('Name:  ${profile?.name}',style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),

              const SizedBox(height: 30,),
               Text('Age:  ${profile?.age}',style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),

               const SizedBox(height: 30,),
               Text('Gender:  ${profile?.gender}',style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),

               const SizedBox(height: 30,),
               Text('Height:  ${profile?.height}',style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),

               const SizedBox(height: 30,),
               Text('Weight:  ${profile?.weight}',style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),


              
              
            ],
          ),
        ),
      )
    );
  }
}
