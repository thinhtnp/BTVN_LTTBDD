import 'package:flutter/material.dart';
import '../models/user.dart';

class UsersScreen extends StatelessWidget {
  final List<User> users;
  final Function(String) onAddUser;

  const UsersScreen({
    super.key,
    required this.users,
    required this.onAddUser,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nhân viên")),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children:
              users.map((u) => ListTile(title: Text(u.name))).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                final controller = TextEditingController();
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text("Thêm nhân viên"),
                    content: TextField(
                      controller: controller,
                      decoration:
                      const InputDecoration(hintText: "Tên nhân viên"),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Hủy"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          onAddUser(controller.text);
                          Navigator.pop(context);
                        },
                        child: const Text("Thêm"),
                      ),
                    ],
                  ),
                );
              },
              child: const Text("Thêm nhân viên"),
            ),
          ),
        ],
      ),
    );
  }
}
