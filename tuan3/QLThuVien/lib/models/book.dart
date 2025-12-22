class Book {
  final String name;
  bool isBorrowed;
  String? borrowedBy;

  Book({
    required this.name,
    this.isBorrowed = false,
    this.borrowedBy,
  });
}
