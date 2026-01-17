import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final nameCtrl = TextEditingController();
  final yearCtrl = TextEditingController();
  final hometownCtrl = TextEditingController();

  String profileResult = '';

  Future<void> _goToProfile() async {
    if (nameCtrl.text.isEmpty ||
        yearCtrl.text.isEmpty ||
        hometownCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập đầy đủ thông tin')),
      );
      return;
    }

    final result = await Navigator.pushNamed(
      context,
      AppRoutes.profile,
      arguments: {
        'name': nameCtrl.text,
        'birthYear': int.parse(yearCtrl.text),
        'hometown': hometownCtrl.text,
      },
    );

    if (result != null) {
      setState(() {
        profileResult = result as String;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(labelText: 'Họ và tên'),
            ),
            TextField(
              controller: yearCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Năm sinh'),
            ),
            TextField(
              controller: hometownCtrl,
              decoration: const InputDecoration(labelText: 'Quê quán'),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _goToProfile,
              child: const Text('Tiếp tục'),
            ),

            const SizedBox(height: 30),
            Text(
              profileResult,
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
