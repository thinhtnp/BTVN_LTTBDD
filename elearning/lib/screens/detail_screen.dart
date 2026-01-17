import 'package:flutter/material.dart';
import '../models/user.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      appBar: AppBar(title: const Text('Profile tổng hợp')),
      body: Center(
        child: Card(
          elevation: 5,
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  user.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Năm sinh: ${user.birthYear}'),
                Text('Quê quán: ${user.hometown}'),
                Text('Chuyên ngành: ${user.major}'),
                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                      'Hồ sơ: ${user.name} - ${user.major} (${user.birthYear})',
                    );
                  },
                  child: const Text('Hoàn tất'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
