import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Soil extends StatefulWidget {
  final double progress;

  const Soil({super.key, required this.progress, required String title});

  @override
  _Soil createState() => _Soil();
}

class _Soil extends State<Soil> {
  late double _progress;

  @override
  void initState() {
    super.initState();
    _progress = widget.progress;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
        ),
    
        Center(
          child: Text('Soil Health: ${_progress.toStringAsFixed(0)}%', style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            overflow: TextOverflow.ellipsis
          ),),
        ),

        Container(
          height: 40,
        ),

        Expanded(
          child: SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                minimum: 0,
                maximum: 100,
                showLabels: false,
                showTicks: false,
                axisLineStyle: const AxisLineStyle(
                  thickness: 0.25,
                  cornerStyle: CornerStyle.bothCurve,
                  thicknessUnit: GaugeSizeUnit.factor,
                ),
                pointers: <GaugePointer>[
                  RangePointer(
                    value: _progress,
                    cornerStyle: CornerStyle.bothCurve,
                    width: 0.25,
                    color: Colors.greenAccent[100],
                    sizeUnit: GaugeSizeUnit.factor,
                  ),
                ],
                annotations: const <GaugeAnnotation>[
                  GaugeAnnotation(
                    positionFactor: 0.1,
                    angle: 90,
                    /*widget: Text(
                      '${_progress.toStringAsFixed(0)}%',
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    ),*/
                    widget: Image(
                      image: AssetImage('assets/logo-t.png'),
                      width: 400,
                      height: 400,)
                  )
                ]
              )
            ]
          )
        ),
      ]
    );
  }
}