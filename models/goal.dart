class Goal {
  final int? id;
  final String title;
  final String description;
  final int progress;

  Goal({this.id, required this.title, required this.description, this.progress = 0});

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'description': description, 'progress': progress};
  }

  factory Goal.fromMap(Map<String, dynamic> map) {
    return Goal(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      progress: map['progress'],
    );
  }
}