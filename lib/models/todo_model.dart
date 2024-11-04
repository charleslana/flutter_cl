class TodoModel {
  const TodoModel({this.userId, this.id, this.title, this.completed});

  factory TodoModel.fromJson(Map<String, Object?> json) {
    return TodoModel(
        userId: json['userId'] == null ? null : json['userId'] as int,
        id: json['id'] == null ? null : json['id'] as int,
        title: json['title'] == null ? null : json['title'] as String,
        completed:
            json['completed'] == null ? null : json['completed'] as bool);
  }

  final int? userId;
  final int? id;
  final String? title;
  final bool? completed;

  TodoModel copyWith({int? userId, int? id, String? title, bool? completed}) {
    return TodoModel(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
        completed: completed ?? this.completed);
  }

  Map<String, Object?> toJson() {
    return {'userId': userId, 'id': id, 'title': title, 'completed': completed};
  }

  @override
  String toString() {
    return 'TodoModel(userId:$userId, id:$id, title:$title, completed:$completed) ';
  }
}
