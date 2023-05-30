import 'dart:math';

import 'package:flutter/material.dart';

class PassByScreen extends StatefulWidget {
  const PassByScreen({super.key});

  @override
  State<PassByScreen> createState() => _PassByScreenState();
}

class _PassByScreenState extends State<PassByScreen> {
  final _notifier = ValueNotifier<String>('');
  int _counter = 0;
  bool _useCallback = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 50,
            left: 125,
            child: CounterWidget(
              counter: _counter,
              callback: _useCallback ? _increase : null,
            ),
          ),
          Positioned(
            top: 250,
            left: 130,
            child: Text(
              'Parent Counter: ' + _counter.toString(),
              style: TextStyle(
                fontSize: 20,
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
                          'Tăng Counter',
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
                          'Giảm Counter',
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _useCallback = !_useCallback;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10), // Kích thước lề
                    ),
                    child: Text(
                      _useCallback ? 'Truyền tham trị' : 'Dùng callback',
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  void _increase() {
    setState(() {
      _counter++;
    });
  }
}

class CounterWidget extends StatefulWidget {
  int counter;
  void Function()? callback;

  CounterWidget({
    super.key,
    required this.counter,
    this.callback,
  });

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Text(
            'Child Counter: ' + widget.counter.toString(),
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(height: 16),
        IconButton(
            onPressed: () {
              setState(() {
                if (widget.callback != null) {
                  widget.callback!.call();
                  return;
                }
                widget.counter++;
              });
            },
            icon: Icon(Icons.add))
      ],
    );
  }
}
