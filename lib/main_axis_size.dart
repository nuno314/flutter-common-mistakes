import 'dart:math';

import 'package:flutter/material.dart';

class MainAxisSizeScreen extends StatefulWidget {
  const MainAxisSizeScreen({super.key});

  @override
  State<MainAxisSizeScreen> createState() => _MainAxisSizeScreenState();
}

class _MainAxisSizeScreenState extends State<MainAxisSizeScreen> {
  int _counter = 0;
  double _height = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
      _height += 100;
    });
  }

  bool _useSizedBox = false;

  Widget _buildRandomText(int index) {
    return Container(
      decoration: BoxDecoration(
          color: _generateRandomColor(),
          borderRadius: BorderRadius.circular(16)),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        'Text $index',
        style: TextStyle(fontSize: 14, color: Colors.white),
      ),
    );
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
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: _useSizedBox ? 200 : null,
              child: Column(
                mainAxisSize:
                    _useSizedBox ? MainAxisSize.max : MainAxisSize.min,
                children:
                    List.generate(_counter, (index) => _buildRandomText(index))
                        .toList(),
              ),
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height - 150,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _counter++;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green, // Màu nền của nút
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10), // Kích thước lề
                        ),
                        child: const Text(
                          'Thêm Widget',
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _counter--;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red, // Màu nền của nút
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10), // Kích thước lề
                        ),
                        child: const Text(
                          'Xóa Widget',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _useSizedBox = !_useSizedBox;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10), // Kích thước lề
                    ),
                    child: Text(
                      _useSizedBox ? 'Dùng mainAxisSize' : 'Dùng SizedBox',
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
