import 'package:flutter/material.dart';

class Dietscreen extends StatefulWidget {
  const Dietscreen({super.key});

  @override
  State<Dietscreen> createState() => _DietscreenState();
}

class _DietscreenState extends State<Dietscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diet'),
      ),
    );
  }
}
