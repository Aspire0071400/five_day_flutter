import 'package:five_day_flutter/project_2/pages/taskly.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter("hive_boxes");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Moon",
      theme: ThemeData(
        primaryColor: Colors.red,
        appBarTheme: const AppBarTheme(
          color: Colors.red,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Taskly(),
    );
  }
}
