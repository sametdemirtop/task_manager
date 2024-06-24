class Task {
  final String title;
  final String description;
  final String image;
  final String dueDate;

  Task(
      {required this.title,
      required this.description,
      required this.image,
      required this.dueDate});

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'image': image,
        'dueDate': dueDate,
      };

  static Task fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'],
      description: json['description'],
      image: json['image'],
      dueDate: json['dueDate'],
    );
  }
}
