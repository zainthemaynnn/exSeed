import 'package:exseed/grid.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class TaskList extends StatefulWidget {
  late Map<Crop, double> amounts;
  void Function(Map<Crop, double>) onRatioUpdate;

  TaskList({super.key, required this.amounts, required this.onRatioUpdate});

  String cropName(Crop crop) {
    switch (crop) {
      case Crop.rice:
        return "Rice";
      case Crop.maize:
        return "Maize";
      case Crop.sugarCane:
        return "Sugar Cane";
      case Crop.chickPeas:
        return "Chick Peas";
      case Crop.mustardSeeds:
        return "Mustard Seeds";
      case Crop.frenchBeans:
        return "French Beans";
      case Crop.npk421:
        return "NPK 4:2:1 fertilizer";
      case Crop.npk222:
        return "NPK 2:2:2 fertilizer";
    }
  }

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  void _onItemAmountSet(double amount, Crop crop) {
    setState(() {
      widget.amounts.addEntries({crop: amount}.entries);
    });
  }

  @override
  Widget build(BuildContext context) {
    var pieChart = PieChart(
          dataMap: {
            for (var crop in Crop.values) widget.cropName(crop): widget.amounts[crop]!
          },
          chartRadius: 180.0,
        );
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
        pieChart,
        Expanded(
          child: ListView.builder(
            itemCount: Crop.values.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        double amount = widget.amounts[Crop.values[index]]!;
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
                  title: Text(widget.cropName(Crop.values[index])),
                  trailing:
                      Text("${widget.amounts[Crop.values[index]]} Acres"),
                ),
              );
            },
          ),
        ),
        TextButton(
            child: const Text("Confirm"),
            onPressed: () {
              widget.onRatioUpdate(widget.amounts);
              Navigator.pop(context);
            },
          ),
      ],
    );
  }
}
