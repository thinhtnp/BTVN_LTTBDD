import 'package:flutter/material.dart';

void main() {
  runApp(const UngDung());
}

class UngDung extends StatelessWidget {
  const UngDung({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ManHinhViDuNullable(),
    );
  }
}

class ManHinhViDuNullable extends StatefulWidget {
  const ManHinhViDuNullable({super.key});

  @override
  State<ManHinhViDuNullable> createState() => _ManHinhViDuNullableState();
}

class _ManHinhViDuNullableState extends State<ManHinhViDuNullable> {
  /// Controller lấy dữ liệu từ ô nhập
  final TextEditingController boDieuKhienTen =
  TextEditingController();

  /// Biến nullable
  String? tenNguoiDung;

  /// Kết quả hiển thị
  String ketQua = "";

  void kiemTraNullable() {
    setState(() {
      tenNguoiDung = boDieuKhienTen.text.trim().isEmpty
          ? null
          : boDieuKhienTen.text.trim();

      if (tenNguoiDung == null) {
        ketQua = "Bạn chưa nhập tên";
      } else {
        ketQua = "Độ dài tên: ${tenNguoiDung!.length}";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ví dụ Nullable"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: boDieuKhienTen,
              decoration: const InputDecoration(
                labelText: "Nhập tên",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: kiemTraNullable,
              child: const Text("Kiểm tra"),
            ),
            const SizedBox(height: 20),
            Text(
              ketQua,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
