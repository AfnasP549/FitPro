// ignore_for_file: file_names

import 'package:fitpro/screens/admin/admin_login.dart';
import 'package:fitpro/screens/user/profile.dart';
import 'package:fitpro/widget/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EndDrawer extends StatelessWidget {
  const EndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: MyColors.Black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: double.infinity,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: MyColors.Black,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Settings',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: MyColors.LGrey,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: const Icon(
                      FontAwesomeIcons.idBadge,
                      color: MyColors.White,
                    ),
                    title: const Text(
                      'Profile',
                      style: TextStyle(
                        color: MyColors.White,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => const Profile()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      FontAwesomeIcons.userGear,
                      color: MyColors.White,
                    ),
                    title: const Text(
                      'Admin',
                      style: TextStyle(
                        color: MyColors.White,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Alert'),
                              content: const Text('Are you an Admin?'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const AdminLogin()));
                                    },
                                    child: const Text('Yes')),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('No'))
                              ],
                            );
                          });
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      FontAwesomeIcons.share,
                      color: MyColors.White,
                    ),
                    title: const Text(
                      'Share with Friends',
                      style: TextStyle(color: MyColors.White),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      FontAwesomeIcons.eye,
                      color: MyColors.White,
                    ),
                    title: const Text(
                      'Privacy Policy',
                      style: TextStyle(
                        color: MyColors.White,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      FontAwesomeIcons.addressCard,
                      color: MyColors.White,
                    ),
                    title: const Text(
                      'About Us',
                      style: TextStyle(
                        color: MyColors.White,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
