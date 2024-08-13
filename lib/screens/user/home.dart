import 'package:fitpro/screens/user/training.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'HOME WORKOUT',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromARGB(255, 38, 38,38),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'FULLBODY \nCHALLENGE',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 208, 212, 208),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '24x7',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Image.asset(
                            'images/Home.png',
                            height: 300,
                            width: 210,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => const Training()));
                      },
                      child: const Text(
                        'START',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
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
          // Container(
          //   decoration: BoxDecoration(
          //     gradient: const LinearGradient(
          //       colors: [
          //         Color.fromARGB(255, 65, 64, 64),
          //         Colors.white,
          //       ],
          //       begin: Alignment.bottomRight,
          //       end: Alignment.topLeft,
          //     ),
          //     borderRadius: BorderRadius.circular(8),
          //   ),
          //   child: const Padding(
          //     padding: EdgeInsets.all(55.0),
          //     child: Column(
          //       children: [
          //         Text(
          //           '“Suck it Up. And One Day You\n Won’t Have to Suck It In.”',
          //           style: TextStyle(
          //             fontSize: 20,
          //             fontWeight: FontWeight.w500,
          //           ),
          //         ),
          //         Padding(
          //           padding: EdgeInsets.only(left: 180),
          //           child: Text(
          //             '-Micheal',
          //             style: TextStyle(
          //               fontSize: 20,
          //               fontWeight: FontWeight.w500,
          //             ),
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
