import 'package:flutter/material.dart';
import '../widgets/app_logo.dart';
import 'screen_2_verify_code.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final emailController = TextEditingController();
  String? errorText;

  String? resultEmail;
  String? resultPassword;
  String? resultVerityCode;

  bool isValidEmail(String email) => email.contains("@");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppLogo(),
            const SizedBox(height: 24),

            const Text("Forget Password?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            const Text(
              "Enter your Email, we will send you a verification code.",
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Your Email",
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
                  final email = emailController.text.trim();
                  if (!isValidEmail(email)) {
                    setState(() => errorText = "Email không hợp lệ");
                    return;
                  }
                  setState(() => errorText = null);

                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => VerifyCodeScreen(email: email),
                    ),
                  );

                  if (result != null) {
                    setState(() {
                      resultEmail = result["email"];
                      resultPassword = result["password"];
                      resultVerityCode = result["Verify Code"];
                    });
                  }
                },
                child: const Text("Next"),
              ),
            ),

            if (resultEmail != null && resultPassword != null && resultVerityCode != null) ...[
              const SizedBox(height: 24),
              const Divider(),
              Text("Email: $resultEmail"),
              Text("Password: $resultPassword"),
              Text("VerityCode: $resultVerityCode"),
            ],
          ],
        ),
      ),
    );
  }
}
