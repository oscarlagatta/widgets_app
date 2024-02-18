import 'package:flutter/material.dart';

void main() => runApp(const WidgetsMainApp());

class WidgetsMainApp extends StatelessWidget {
  const WidgetsMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}


// git checkout -- .  -> will recover all up to the last commit.