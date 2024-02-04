import 'package:exseed/grid.dart';
import 'package:flutter/material.dart';
import 'package:exseed/recommendations.dart';
import 'package:exseed/soil.dart';
//firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'exSeed',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'exSeed Main Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  late Map<Crop, double> amounts;

  _MyHomePageState() {
    crops = CropsPage();
    soil = Soil(output: SoilOutput(N: 0.0, P: 0.0, K: 0.0, progress: 0.0));
    rec = Recommendations();
    amounts =
        Map.fromIterables(Crop.values, List.filled(Crop.values.length, 0));
  }

  late CropsPage crops;
  late Soil soil;
  late Recommendations rec;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  SoilOutput calculateSoil(List<CropCell> cells) {
    double N = 0.0;
    double P = 0.0;
    double K = 0.0;
    double score = 100.0;
    var major = 'x';

    for (int i = 0; i < cells.length; ++i) {
      var cell = cells[i];
      var n, p, k;
      cell.amounts.forEach((crop, amount) {
        var nutrients = nutrientsTable.firstWhere((e) => e.ty == crop);
        n += nutrients.nitrogen * amount;
        p += nutrients.phosphorus * amount;
        k += nutrients.potassium * amount;
      });

      N += n;
      P += p;
      K += k;

      if (n > p && n > k) {
        if (major == 'n') {
          score -= 10;
        }
        major = 'n';
      } else if (p > k) {
        if (major == 'p') {
          score -= 10;
        }
        major = 'p';
      } else {
        if (major == 'k') {
          score -= 10;
        }
        major = 'k';
      }
    }

    return SoilOutput(
      N: N,
      P: P,
      K: K,
      progress: 100.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    var selected;
    if (_selectedIndex == 0) {
      selected = crops;
    } else if (_selectedIndex == 1) {
      selected = Soil(output: calculateSoil(crops.widgets));
    } else if (_selectedIndex == 2) {
      selected = rec;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: selected,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.nature_outlined),
            label: 'My Crops',
            backgroundColor: Color(0xFFA1887F),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monitor_heart_outlined),
            label: 'Soil Health',
            backgroundColor: Color(0xFFA1887F),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.interests_outlined),
            label: 'Recommendations',
            backgroundColor: Color(0xFFA1887F),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.black,
        backgroundColor: Color(0xFFA1887F),
        onTap: _onItemTapped,
      ),
    );
  }
}
