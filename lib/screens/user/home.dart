import 'package:fitpro/screens/user/training.dart';
import 'package:fitpro/widget/colors.dart';
import 'package:fitpro/widget/custom_appbar.dart';
import 'package:fitpro/widget/endDrawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        text1: 'Home',
        icons: FontAwesomeIcons.bars,
      ),
      backgroundColor: MyColors.Black,
      endDrawer: const EndDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('images/HOME1.png'),
                      fit: BoxFit
                          .cover, 
                    ),
                    borderRadius: BorderRadius.circular(20), 
                  ),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                width: 68,
                              ),
                              SizedBox(
                                width: 245, 
                                height: 40, 
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (ctx) =>
                                               const Training()));
                                              //const Dummy()));
                                              

                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          20),
                                    ),
                                  ),
                                  child: const Text(
                                    'START',
                                    style: TextStyle(
                                      fontSize: 18, 
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),

          const SizedBox(
            height: 80,
          ),

          const Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  '“The pain you feel today will be the strength you feel tomorrow.”',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 180),
                child: Text(
                  '– Anonymous',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
