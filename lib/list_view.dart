import 'dart:math';

import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  int _counter = 0;
  double _height = 0;
  final _notifier = ValueNotifier<String>('');

  bool _useListView = true;

  @override
  Widget build(BuildContext context) {
    final listView = ListView(
        children: List.generate(
            100,
            (index) => _ListItem(
                text: index,
                onBuild: (idx) {
                  _notifier.value = 'build Text $idx' '\n' + _notifier.value;
                })));

    final listViewBuilder = ListView.builder(
      itemBuilder: (context, index) {
        return _ListItem(
            text: index,
            onBuild: (idx) {
              _notifier.value = 'build Text $idx' '\n' + _notifier.value;
            });
      },
      itemCount: 100,
    );

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          _useListView ? listView : listViewBuilder,
          ValueListenableBuilder<String>(
            valueListenable: _notifier,
            builder: (context, value, child) =>
                Positioned(right: 20, top: 20, child: Text(value)),
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
                            _useListView = true;
                            _notifier.value = '';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green, // Màu nền của nút
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10), // Kích thước lề
                        ),
                        child: const Text(
                          'ListView',
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _useListView = false;
                            _notifier.value = '';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red, // Màu nền của nút
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10), // Kích thước lề
                        ),
                        child: const Text(
                          'ListView.builder',
                        ),
                      ),
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final int text;

  final void Function(int) onBuild;

  const _ListItem({super.key, required this.text, required this.onBuild});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      // Gọi callback sau khi widget được xây dựng
      onBuild.call(text);
    });

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Text(
        'Text ' + text.toString(),
        style: TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
