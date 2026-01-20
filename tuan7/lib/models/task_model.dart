class Task {
  final int id;
  final String title;
  final String description;
  final String status;
  bool isDone;   // ✅ thêm

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    this.isDone = false,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      status: json['status'],
      isDone: json['isDone'] ?? false,
    );
  }
}
