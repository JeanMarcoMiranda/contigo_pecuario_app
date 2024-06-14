import 'package:contigo_pecuario/features/animalControl/presentation/pages/animal_control_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0ba293)),
        useMaterial3: true,
      ),
      initialRoute: 'animalControl',
      routes: {
        'animalControl': (context) => AnimalControlPage()
      },
    );
  }
}

