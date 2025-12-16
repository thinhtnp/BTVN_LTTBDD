import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NumberInputScreen(),
    );
  }
}
/// Màn hình nhập số và hiển thị danh sách
class NumberInputScreen extends StatefulWidget {
  const NumberInputScreen({super.key});

  @override
  State<NumberInputScreen> createState() => _NumberInputScreenState();
}

class _NumberInputScreenState extends State<NumberInputScreen> {
  ///lấy dữ liệu từ TextField
  final TextEditingController numberController = TextEditingController();

  String errorText = "";

  List<int> numberList = [];

  /// Hàm xử lý khi nhấn nút "Tạo"
  void onCreateButtonPressed() {
    setState(() {
      errorText = "";
      numberList.clear();

      String inputText = numberController.text.trim();

      int? quantity = int.tryParse(inputText);

      if (quantity == null || quantity <= 0) {
        errorText = "Dữ liệu bạn nhập không hợp lệ";
      } else {
        // Tạo danh sách từ 1 đến quantity
        numberList = List.generate(quantity, (index) => index + 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Spacer(),


            const Text(
              "Thực hành 02",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
              ),

            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: numberController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Nhập vào số lượng",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: onCreateButtonPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text(
                    "Tạo",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ),
              ],
            ),

            const SizedBox(height: 10),

            /// Hiển thị thông báo lỗi nếu có
            if (errorText.isNotEmpty)
              Text(
                errorText,
                style: const TextStyle(color: Colors.red),
              ),

            const SizedBox(height: 20),

            /// Danh sách các số được tạo
            Expanded(
              child: ListView.builder(
                itemCount: numberList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      numberList[index].toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
