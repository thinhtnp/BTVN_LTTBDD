import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.assignment_turned_in,
              size: 90, color: Colors.grey.shade400),
          const SizedBox(height: 16),
          const Text(
            'No Tasks Yet!',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 6),
          const Text(
            'Stay productive – add something to do',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
