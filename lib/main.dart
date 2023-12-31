import 'package:flutter/material.dart';

import 'character_list.dart';

//Flavor check!
const String flavor = String.fromEnvironment('app.flavor');

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleByFlavor()),
      ),
      body: CharacterList(),
    );
  }

  String titleByFlavor() {
    return flavor == 'simpsons'
        ? 'Simpsons Character Viewer'
        : 'The Wire Character Viewer';
  }
}
