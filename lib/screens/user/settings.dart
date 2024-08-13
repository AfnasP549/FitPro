// ignore_for_file: file_names

import 'package:fitpro/screens/admin/adminhome.dart';
import 'package:fitpro/screens/user/profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Settings')),
        actions:  [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(onPressed: (){
              showDialog(
                context: context,
                 builder: (BuildContext context){
                  return AlertDialog(
                    title: Text('Alert'),
                    content: Text('Are you an admin?'),
                    actions: [
                      TextButton(onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Adminhome()));
                      }, child: Text('Yes')),
                      TextButton(onPressed: (){
                       Navigator.of(context).pop();
                      }, child: Text('No'))

                    ],
                  );
                 }
                 );
            }, icon: Icon(Icons.admin_panel_settings,size: 30,)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Center(
                child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 80,
              backgroundImage: AssetImage('images/avatar.jpeg'),
            )),
            const SizedBox(
              height: 50,
            ),
            // ignore: prefer_const_constructors
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                children: [
                  InkWell(
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.person),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Profile()));
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.notification_important),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Notifications',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.privacy_tip),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Privacy policy',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(FontAwesomeIcons.addressCard),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'About Us',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
