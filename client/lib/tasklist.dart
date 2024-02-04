import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

enum Crop {
  rice,
  cotton,
  sugarCane,
  wheat,
}

class _TaskListState extends State<TaskList> {
  late Map<Crop, double> _amounts;

  _TaskListState() {
    _amounts =
        Map.fromIterables(Crop.values, List.filled(Crop.values.length, 0));
  }

  void _onItemAmountSet(double amount, Crop crop) {
    setState(() {
      _amounts.addEntries({crop: amount}.entries);
    });
  }

  String cropName(Crop crop) {
    switch (crop) {
      case Crop.rice:
        return "Rice";
      case Crop.cotton:
        return "Cotton";
      case Crop.sugarCane:
        return "Sugar Cane";
      case Crop.wheat:
        return "Wheat";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
        ),
        const Text(
          'Monthly Crop Choices',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        PieChart(
          dataMap: {
            for (var crop in Crop.values) cropName(crop): _amounts[crop]!
          },
          chartRadius: 180.0,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: Crop.values.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        double amount = _amounts[Crop.values[index]]!;
                        return AlertDialog(
                          title: const Text("Enter area (acres)"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                autofocus: true,
                                onChanged: (value) {
                                  var tmp = double.tryParse(value);
                                  if (tmp != null) {
                                    amount = tmp;
                                  }
                                },
                                onSubmitted: (value) {
                                  _onItemAmountSet(amount, Crop.values[index]);
                                  Navigator.pop(context);
                                },
                              ),
                              TextButton(
                                onPressed: () {
                                  _onItemAmountSet(amount, Crop.values[index]);
                                  Navigator.pop(context);
                                },
                                child: const Text("Submit"),
                              ),
                            ],
                          ),
                        );
                      });
                },
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text('${index + 1}'),
                  ),
                  title: Text(cropName(Crop.values[index])),
                  trailing: Text("${_amounts[Crop.values[index]]} Acres"),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
