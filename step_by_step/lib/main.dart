import 'package:flutter/material.dart';
import 'package:step_by_step/screens/set_state_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 51, 75, 182)),
      ),
      home: const SetStateExample(),
    );
  }
}
