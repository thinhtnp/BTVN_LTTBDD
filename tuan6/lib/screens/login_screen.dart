import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'profile_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final AuthService _authService = AuthService();

  void _handleLogin(BuildContext context) async {
    try {
      final user = await _authService.signInWithGoogle();

      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => ProfileScreen(user: user),
          ),
        );
      } else {
        _showError(context, 'Đăng nhập đã bị huỷ');
      }
    } catch (e) {
      _showError(context, 'Đăng nhập thất bại');
    }
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 120,
            ),
            const SizedBox(height: 24),
            const Text(
              'SmartTasks',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'A simple and efficient to-do app',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              icon: const Icon(Icons.login),
              label: const Text('SIGN IN WITH GOOGLE'),
              onPressed: () => _handleLogin(context),
            ),
          ],
        ),
      ),
    );
  }
}
