import 'package:flutter/material.dart';
import 'package:food_ui/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Food Delivery UI',
      theme: ThemeData(
        colorScheme: const ColorScheme.light()
            .copyWith(primary: Colors.deepOrangeAccent),
        scaffoldBackgroundColor: Colors.grey[50],
      ),
      home: const HomeScreen(),
    );
  }
}
