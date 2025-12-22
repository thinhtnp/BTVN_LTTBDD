import 'package:flutter/material.dart';
import '../models/book.dart';
import '../models/user.dart';
import 'manage_screen.dart';
import 'books_list_screen.dart';
import 'users_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  // ===== DỮ LIỆU DÙNG CHUNG =====
  User currentUser = User(name: "Nguyen Van A");

  final List<User> users = [
    User(name: "Nguyen Van A"),
  ];

  final List<Book> books = [
    Book(name: "Sách 01"),
    Book(name: "Sách 02"),
  ];

  @override
  Widget build(BuildContext context) {
    final screens = [
      ManageScreen(
        currentUser: currentUser,
        users: users, // 👈 TRUYỀN DANH SÁCH NHÂN VIÊN
        books: books,
        onChangeUser: (user) {
          setState(() {
            currentUser = user;
          });
        },
        onAddBook: (name) {
          setState(() {
            books.add(Book(name: name));
          });
        },
      ),
      BooksListScreen(books: books),
      UsersScreen(
        users: users,
        onAddUser: (name) {
          setState(() {
            users.add(User(name: name));
          });
        },
      ),
    ];

    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Quản lý",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "DS Sách",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Nhân viên",
          ),
        ],
      ),
    );
  }
}
