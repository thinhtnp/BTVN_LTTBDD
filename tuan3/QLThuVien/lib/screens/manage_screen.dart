import 'package:flutter/material.dart';
import '../models/book.dart';
import '../models/user.dart';

class ManageScreen extends StatefulWidget {
  final User currentUser;
  final List<User> users; // 👈 DANH SÁCH NHÂN VIÊN
  final List<Book> books;
  final Function(User) onChangeUser;
  final Function(String) onAddBook;

  const ManageScreen({
    super.key,
    required this.currentUser,
    required this.users,
    required this.books,
    required this.onChangeUser,
    required this.onAddBook,
  });

  @override
  State<ManageScreen> createState() => _ManageScreenState();
}

class _ManageScreenState extends State<ManageScreen> {

  // ===== MƯỢN / TRẢ SÁCH =====
  void toggleBorrow(Book book) {
    setState(() {
      if (!book.isBorrowed) {
        book.isBorrowed = true;
        book.borrowedBy = widget.currentUser.name;
      } else {
        book.isBorrowed = false;
        book.borrowedBy = null;
      }
    });
  }

  // ===== THÊM SÁCH =====
  void showAddBookDialog() {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Thêm sách"),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: "Tên sách"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Hủy"),
          ),
          ElevatedButton(
            onPressed: () {
              widget.onAddBook(controller.text);
              Navigator.pop(context);
            },
            child: const Text("Thêm"),
          ),
        ],
      ),
    );
  }

  // ===== ĐỔI NHÂN VIÊN (CHỌN TỪ DANH SÁCH) =====
  void showChangeUserDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Chọn nhân viên"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: widget.users.map((user) {
            return ListTile(
              title: Text(user.name),
              onTap: () {
                widget.onChangeUser(user);
                Navigator.pop(context);
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hệ thống Quản lý Thư viện"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== NHÂN VIÊN =====
            const Text(
              "Nhân viên",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller:
                    TextEditingController(text: widget.currentUser.name),
                    readOnly: true,
                    decoration:
                    const InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: showChangeUserDialog,
                  child: const Text("Đổi"),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ===== DANH SÁCH SÁCH =====
            const Text(
              "Danh sách sách",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            ...widget.books.map((book) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(
                      book.isBorrowed
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                      color:
                      book.isBorrowed ? Colors.red : Colors.grey,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(book.name),
                          Text(
                            book.isBorrowed
                                ? "Đang mượn bởi ${book.borrowedBy}"
                                : "Chưa mượn",
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () => toggleBorrow(book),
                      child: Text(book.isBorrowed ? "Trả" : "Mượn"),
                    ),
                  ],
                ),
              );
            }),

            const Spacer(),

            // ===== NÚT THÊM SÁCH =====
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: showAddBookDialog,
                child: const Text("Thêm"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
