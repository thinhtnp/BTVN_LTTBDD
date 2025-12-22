import 'package:flutter/material.dart';
import '../models/book.dart';

class BooksListScreen extends StatelessWidget {
  final List<Book> books;

  const BooksListScreen({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Danh sách sách")),
      body: ListView(
        children: books.map((book) {
          return ListTile(
            title: Text(book.name),
            subtitle: Text(
              book.isBorrowed
                  ? "Đang mượn bởi ${book.borrowedBy}"
                  : "Chưa mượn",
            ),
          );
        }).toList(),
      ),
    );
  }
}
