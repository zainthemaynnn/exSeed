import 'package:flutter/material.dart';

import 'dart:math';
int maxindex = 4;
int max = options.length;
final List<String> options = <String>[
  'Entry A', 'Entry B', 'Entry C',
  'Entry D', 'Entry E', 'Entry F',
  'Entry G', 'Entry H', 'Entry I',
  'Entry J', 'Entry K', 'Entry L',
  'Entry M', 'Entry N', 'Entry O',
  'Entry P', 'Entry Q', 'Entry R',
  'Entry S', 'Entry T', 'Entry U',
  'Entry V', 'Entry W', 'Entry X',
  'Entry Y', 'Entry Z'
  ];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Recommendations'),
          backgroundColor: const Color(0xFFA1887F),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: options.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: Colors.greenAccent[100],
              child: Center(child: Text(options[Random().nextInt(max)]))
            );
          },
        )
      )




    );
  }
}