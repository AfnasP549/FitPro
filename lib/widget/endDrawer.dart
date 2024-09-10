// ignore_for_file: file_names

import 'package:fitproo/screens/admin/admin_login.dart';
import 'package:fitproo/screens/user/about.dart';
import 'package:fitproo/screens/user/privacy_policy.dart';
import 'package:fitproo/screens/user/profile.dart';
import 'package:fitproo/screens/user/termsandconditon.dart';
import 'package:fitproo/widget/colors.dart';
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
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => const PrivacyPolicyScreen(),
                        ),
                      );
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
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => const AboutPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      FontAwesomeIcons.fileContract,
                      color: MyColors.White,
                    ),
                    title: const Text(
                      'Terms and Condition',
                      style: TextStyle(
                        color: MyColors.White,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => const TermsAndCondition(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 290,
                  ),
                  const Center(
                      child: Text(
                    'version: 1.0.0+1',
                    style: TextStyle(
                      color: MyColors.WGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
