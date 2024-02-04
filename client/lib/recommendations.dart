import 'package:flutter/material.dart';

import 'dart:math';
int maxindex = 4;
int max = options.length;
final List<String> options = <String>[
  'Consider crop rotation! Rotate your crops to break pest and disease cycles.', 'Cover cropping is key - some plants can act as a cover for soil during fallow periods.', 'Organic matter in soil makes all the better!',
  'Try mulching! Use elements like straws and wood chips to cover your soil and moderate its temperature, keeping your plantlife safe.', 'Reducing tillage is vital toward maintaining soil structure and preventing soil erosion - try it!', 'Water management cannot be overlooked! Efficient irrigation processes make all the difference.',
  'Drip irrigation, should you use it? Do your plants need direct allocation of water? If so, drip irrigation is what you need!', 'Remember - regularly test soil for nutrient levels and adjust your fertilization accordingly!', "Who doesn't want long-term soil health? Consider organic fertilizers!",
  "Keep your soil healthy, it is a must to keep your plantlife thriving!", 'Ever considered leaving your crop residue on the field after harvest? Try it! It protects your soil from erosion.', 'Companion Planting is crucial! One plant may be best planted alongside another',
  "Don't use pesticides! Avoid chemical pesticides, and rather use insects and organisms that naturally control pests", 'Always ensure your soil is in top condition. Regularly test it for pH and nutrient levels.', 'Encourage biodiversity and agroforesty! Integrate trees and shrubs in your ecosystem.',
  'Keep your soil safe from erosion - try countour farming! Farm only along the contour lines of your land.', 'Reduce the risk of pests and disease on plantlife and diversify your plants!', "It's not all physical! Keep record of your farming practices and monitor the changes in soil health.",
  'Wind is not your friend! Plant windbreaks or shelterbelts to reduce wind erosion and preserve soil structure.', 'Improve soil structure, always! Try planting green manure crops that can be turned into soil.', 'Enhance soil fertility by vermicomposting and utilizing earthworms!',
  'Avoid compacting soil, implement practices that promote natural aeration!', 'Technology is the way! If available, use software for optimal resource use and reduced environmental impact.', 'Soil biology can be enhanced with liquid fertilizers. Did you know one of these fertilizers is tea?',
  'Spread the word! Promote awareness about the endangerment of plants and wildlife due to the improper etiquette present in thousands of farms!', 'Do your best to promote awareness about proper agricultural practices to every farmer you come!'
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