import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double value = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Slider")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Slider(
              value: value,
              min: 0,
              max: 100,
              divisions: 10,
              label: value.round().toString(),
              onChanged: (v) => setState(() => value = v),
            ),
            const SizedBox(height: 16),
            Text(
              "Value: ${value.round()}",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
