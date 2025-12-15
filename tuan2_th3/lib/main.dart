import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Widget gốc của ứng dụng
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

/// Màn hình tính toán
class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  /// Controller cho 2 ô nhập số
  final TextEditingController firstNumberController =
  TextEditingController();
  final TextEditingController secondNumberController =
  TextEditingController();

  /// Kết quả hiển thị
  String resultText = "";

  /// Hàm tính toán
  void calculate(String operator) {
    setState(() {
      double? a = double.tryParse(firstNumberController.text);
      double? b = double.tryParse(secondNumberController.text);

      if (a == null || b == null) {
        resultText = "Dữ liệu không hợp lệ";
        return;
      }

      double result = 0;

      switch (operator) {
        case "+":
          result = a + b;
          break;
        case "-":
          result = a - b;
          break;
        case "*":
          result = a * b;
          break;
        case "/":
          if (b == 0) {
            resultText = "Không thể chia cho 0";
            return;
          }
          result = a / b;
          break;
      }

      resultText = result.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 40),

              /// Tiêu đề
              const Text(
                "Thực hành 03",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              /// Ô nhập số thứ nhất
              TextField(
                controller: firstNumberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Nhập số thứ nhất",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              /// Các nút phép toán
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  operationButton("+", Colors.red),
                  operationButton("-", Colors.amber),
                  operationButton("*", Colors.purple),
                  operationButton("/", Colors.black),
                ],
              ),

              const SizedBox(height: 20),

              /// Ô nhập số thứ hai
              TextField(
                controller: secondNumberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Nhập số thứ hai",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// Hiển thị kết quả
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Kết quả: $resultText",
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Widget tạo nút phép toán 
  Widget operationButton(String symbol, Color color) {
    return SizedBox(
      width: 50,
      height: 50,
      child: ElevatedButton(
        onPressed: () => calculate(symbol),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Text(
          symbol,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
