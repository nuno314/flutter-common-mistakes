// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';

class ConstScreen extends StatefulWidget {
  const ConstScreen({super.key});

  @override
  State<ConstScreen> createState() => _ConstScreenState();
}

class _ConstScreenState extends State<ConstScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
child: Column(
  children: [
    const SizedBox(height: 150),
    const ConstWidget(),
    const SizedBox(height: 50),
    NotConstWidget(),
    const SizedBox(height: 50),
    ElevatedButton.icon(
        onPressed: () {
          setState(() {});
        },
        icon: Icon(Icons.refresh),
        label: Text('setState')),
  ],
),
          ),
        ],
      ),
    );
  }
}

class ConstWidget extends StatefulWidget {
  const ConstWidget({super.key});

  @override
  State<ConstWidget> createState() => _ConstWidgetState();
}

class _ConstWidgetState extends State<ConstWidget> {
  @override
  Widget build(BuildContext context) {
    final random = Random().nextInt(100);
    return Text('ConstWidget build: $random');
  }
}

class NotConstWidget extends StatefulWidget {
  const NotConstWidget({super.key});

  @override
  State<NotConstWidget> createState() => _NotConstWidgetState();
}

class _NotConstWidgetState extends State<NotConstWidget> {
  @override
  Widget build(BuildContext context) {
    final random = Random().nextInt(100);
    return Text('NotConstWidget build: $random');
  }
}
