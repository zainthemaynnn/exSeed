import 'package:flutter/material.dart';

class CropsPage extends StatefulWidget {
  const CropsPage({super.key});

  @override
  State<CropsPage> createState() => _CropsState();
}

class _CropsState extends State<CropsPage> {
  (int, int) gridsize = (4, 4);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];

    for (var i = 0; i < gridsize.$1; i++) {
      for (var j = 0; j < gridsize.$2; j++) {
        widgets.add(Container(
          padding: const EdgeInsets.all(8.0),
          width: 400,
          height: 400,
          child: Container(), // FILL HERE
        ));
      }
    }

    return Center(
      child: GridView.count(
      primary: false,
      padding: const EdgeInsets.all(8.0),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: gridsize.$2,
      children: widgets,
    ));
  }
}

enum Crop {
  rice,
  cotton,
  sugarCane,
  wheat,
}
