import 'package:exseed/tasklist.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class CropsPage extends StatelessWidget {
  (int, int) gridsize = (4, 2);
  List<CropCell> widgets = [];

  final List<String> years = [
    "2024",
    "2025",
    "2026",
    "2027",
    "2028",
    "2029",
    "2030",
    "2031",
  ];

  CropsPage() {
    for (var i = 0; i < gridsize.$1 * gridsize.$2; i++) {
      widgets.add(CropCell(title: years[i]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GridView.count(
      primary: false,
      padding: const EdgeInsets.all(8.0),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: gridsize.$1,
      children: widgets,
    ));
  }
}

class CropCell extends StatefulWidget {
  final String title;
  late Map<Crop, double> amounts;
  CropCell({super.key, required this.title}) {
    amounts =
        Map.fromIterables(Crop.values, List.filled(Crop.values.length, 0));
  }

  @override
  State<CropCell> createState() => _CropCellState();
}

class _CropCellState extends State<CropCell> {
  late Map<Crop, double> _amounts;

  @override
  void initState() {
      // TODO: implement initState
      super.initState();
      _amounts = Map.fromIterables(Crop.values, List.filled(Crop.values.length, 0));
    }

  void _onItemAmountSet(Map<Crop, double> amounts) {
    widget.amounts = amounts;
    setState(() {
      _amounts = amounts;
    });
  }

  @override
  Widget build(BuildContext context) {
    var tasklist = TaskList(amounts: _amounts, onRatioUpdate: _onItemAmountSet);
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: 400,
      height: 400,
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Scaffold(body: tasklist)));
        },
        child: PieChart(
          centerText: widget.title,
          dataMap: {
            for (var crop in Crop.values)
              tasklist.cropName(crop): _amounts[crop]!
          },
          legendOptions: const LegendOptions(
            showLegends: false,
          ),
        ),
      ),
    );
  }
}

enum Crop {
  rice,
  maize,
  sugarCane,
  chickPeas,
  mustardSeeds,
  frenchBeans,
}

class CropNutrients {
  final Crop ty;
  final double nitrogen;
  final double phosphorus;
  final double potassium;

  const CropNutrients({
    required this.ty,
    required this.nitrogen,
    required this.phosphorus,
    required this.potassium,
  });
}

final List<CropNutrients> nutrientsTable = [
  const CropNutrients(
    ty: Crop.rice,
    nitrogen: 66,
    phosphorus: 21.8,
    potassium: 122.2,
  ),
  const CropNutrients(
    ty: Crop.maize,
    nitrogen: 150,
    phosphorus: 120,
    potassium: 240,
  ),
  const CropNutrients(
    ty: Crop.sugarCane,
    nitrogen: 378.8,
    phosphorus: 213.333333333333,
    potassium: 186.666666666667,
  ),
  const CropNutrients(
    ty: Crop.chickPeas,
    nitrogen: 225.8,
    phosphorus: 123.6,
    potassium: 244.4,
  ),
  const CropNutrients(
    ty: Crop.mustardSeeds,
    nitrogen: 240,
    phosphorus: 160,
    potassium: 80,
  ),
  const CropNutrients(
    ty: Crop.frenchBeans,
    nitrogen: 280,
    phosphorus: 200,
    potassium: 120,
  ),
];
