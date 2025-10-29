import 'package:flutter/material.dart';
import 'package:pavlova/pavlova.dart';
import 'package:pavlova/edgeInsets.dart';
import 'package:pavlova/AlignmentExamplesApp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: Pavlova(),
      // home: edgeInsets(),
      home: AlignmentExamplesApp(),
    );
  }
}
