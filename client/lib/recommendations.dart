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

class Recommendations extends StatelessWidget {
  const Recommendations({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Random().nextInt(6),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          color: Colors.greenAccent[100],
          child: Center(child: Text(options[Random().nextInt(max)]))
        );
      },
    );
  }
}