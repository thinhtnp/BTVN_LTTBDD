import 'package:flutter/material.dart';
import '../models/user.dart';
import '../routes/app_routes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String major = 'Công nghệ thông tin';

  @override
  Widget build(BuildContext context) {
    final args =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final String name = args['name'];
    final int birthYear = args['birthYear'];
    final String hometown = args['hometown'];

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(name),
              subtitle: Text(
                'Năm sinh: $birthYear\nQuê quán: $hometown',
              ),
            ),

            const SizedBox(height: 20),

            DropdownButtonFormField<String>(
              value: major,
              decoration: const InputDecoration(
                labelText: 'Chuyên ngành',
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Công nghệ thông tin',
                  child: Text('Công nghệ thông tin'),
                ),
                DropdownMenuItem(
                  value: 'Khoa học máy tính',
                  child: Text('Khoa học máy tính'),
                ),
                DropdownMenuItem(
                  value: 'Hệ thống thông tin',
                  child: Text('Hệ thống thông tin'),
                ),
                DropdownMenuItem(
                  value: 'Mạng máy tính',
                  child: Text('Mạng máy tính'),
                ),
                DropdownMenuItem(
                  value: 'Công nghệ phần mềm',
                  child: Text('Công nghẹ phần mềm'),
                ),
              ],
              onChanged: (v) => setState(() => major = v!),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () async {
                final user = User(
                  name: name,
                  birthYear: birthYear,
                  hometown: hometown,
                  major: major,
                );

                final result = await Navigator.pushNamed(
                  context,
                  AppRoutes.detail,
                  arguments: user,
                );

                //về Home
                if (result != null) {
                  Navigator.pop(context, result);
                }
              },
              child: const Text('Xem hồ sơ'),
            ),
          ],
        ),
      ),
    );
  }
}
