import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Soil extends StatefulWidget {
  final SoilOutput output;

  const Soil({super.key, required this.output});

  @override
  _Soil createState() => _Soil();
}

class _Soil extends State<Soil> {
  late double _progress;

  @override
  void initState() {
    super.initState();
    _progress = widget.output.progress;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 40,
      ),
      Center(
        child: Text(
          'Soil Health: ${_progress.toStringAsFixed(0)}%',
          style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              overflow: TextOverflow.ellipsis),
        ),
      ),
      Container(
        height: 40,
      ),
      Center(
          child: SfRadialGauge(axes: <RadialAxis>[
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
                          style: const TextStyle(fontSize: 32, color: Colors.black),
                        ),*/
                      widget: Image(
                        image: AssetImage('assets/logo-t.png'),
                        width: 300,
                        height: 300,
                      ))
                ])
          ]),
      ),
      Text(
              "Nitrogen: ${widget.output.N}\nPhosphorus: ${widget.output.P}\nPotassium: ${widget.output.K}")
    ]);
  }
}

class SoilOutput {
  final double N, P, K;
  final double progress;
  SoilOutput(
      {required this.N,
      required this.P,
      required this.K,
      required this.progress});
}
