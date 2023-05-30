import 'dart:math';

import 'package:common_mistakes/const_widget.dart';
import 'package:common_mistakes/list_view.dart';
import 'package:common_mistakes/main_axis_size.dart';
import 'package:common_mistakes/pass_by.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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
  int _counter = 0;
  double _height = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
      _height += 100;
    });
  }

  Color _generateRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MainAxisSizeScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent, // Màu nền của nút
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10), // Kích thước lề
              ),
              child: const Text(
                'Column / Row',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ListViewScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink, // Màu nền của nút
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10), // Kích thước lề
              ),
              child: const Text(
                'ListView / ListView.builder',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PassByScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Màu nền của nút
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10), // Kích thước lề
              ),
              child: const Text(
                'Pass by reference / Pass by value',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ConstScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple, // Màu nền của nút
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10), // Kích thước lề
              ),
              child: const Text(
                'Const Widget',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
