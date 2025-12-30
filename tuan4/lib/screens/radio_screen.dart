import 'package:flutter/material.dart';

class RadioScreen extends StatefulWidget {
  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  String selected = "A";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Radio")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RadioListTile<String>(
              title: const Text("Option A"),
              value: "A",
              groupValue: selected,
              onChanged: (v) => setState(() => selected = v!),
            ),
            RadioListTile<String>(
              title: const Text("Option B"),
              value: "B",
              groupValue: selected,
              onChanged: (v) => setState(() => selected = v!),
            ),
            RadioListTile<String>(
              title: const Text("Option C"),
              value: "C",
              groupValue: selected,
              onChanged: (v) => setState(() => selected = v!),
            ),
            const SizedBox(height: 16),
            Text(
              "Selected: $selected",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
