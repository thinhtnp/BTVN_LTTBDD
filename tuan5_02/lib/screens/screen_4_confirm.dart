import 'package:flutter/material.dart';
import '../widgets/app_logo.dart';

class ConfirmScreen extends StatelessWidget {
  final String email;
  final String verifyCode;
  final String password;

  const ConfirmScreen({
    super.key,
    required this.email,
    required this.verifyCode,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const BackButton()),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppLogo(),
            const SizedBox(height: 24),

            const Text(
              "Confirm",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text("We are here to help you!"),

            const SizedBox(height: 20),

            // ===== EMAIL =====
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email),
                hintText: email,
                border: const OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            // ===== VERIFY CODE =====
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock_outline),
                hintText: verifyCode,
                border: const OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            // ===== PASSWORD =====
            TextField(
              readOnly: true,
              obscureText: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock),
                hintText: "********",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    {
                      "email": email,
                      "password": password,
                      "Verify Code": verifyCode,
                    },
                  );
                },
                child: const Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
