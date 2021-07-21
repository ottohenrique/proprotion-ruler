import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class ProportionRuler extends StatefulWidget {
  const ProportionRuler({Key? key}) : super(key: key);

  @override
  State<ProportionRuler> createState() => _ProportionRuler();
}

class _ProportionRuler extends State<ProportionRuler> {
  double _currentSliderValue = 75;
  double _max = 100;

  int calcProportion() {
    return (1 / (_currentSliderValue / _max)).round();
  }

  int calcPercent() => ((_currentSliderValue / _max) * 100).round();

  @override
  build(BuildContext context) {
    return Card(
        child: Column(children: <Widget>[
      Text("1/${calcProportion()} = ${calcPercent()} %"),
      Slider(
        max: _max,
        min: 1,
        divisions: 100,
        value: _currentSliderValue,
        onChanged: (double value) {
          setState(() {
            this._currentSliderValue = value;
          });
        },
      )
    ]));
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProportionRuler',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(title: const Text("Proportion Ruler")),
          body: Center(child: ProportionRuler())),
    );
  }
}
