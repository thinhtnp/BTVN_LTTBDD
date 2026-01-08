import 'package:flutter/material.dart';
import '../widgets/app_logo.dart';
import 'screen_4_confirm.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String email;
  final String verifyCode;

  const ResetPasswordScreen({
    super.key,
    required this.email,
    required this.verifyCode,
  });

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  String? errorText;

  bool isMatch() {
    return passwordController.text == confirmController.text;
  }

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
              "Create new password",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: confirmController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Confirm Password",
                border: const OutlineInputBorder(),
                errorText: errorText,
              ),
            ),

            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () async {
                  if (!isMatch()) {
                    setState(() => errorText = "Mật khẩu không khớp");
                    return;
                  }

                  setState(() => errorText = null);

                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ConfirmScreen(
                        email: widget.email,
                        verifyCode: widget.verifyCode,
                        password: passwordController.text,
                      ),
                    ),
                  );

                  Navigator.pop(context, result);
                },
                child: const Text("Next"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
