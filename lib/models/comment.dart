import 'dart:convert';

class Comment {
  Comment({
    required this.text,
    required this.date,
  });

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      text: map['text'] as String,
      date: DateTime.parse(map['date'] as String),
    );
  }

  factory Comment.fromJson(String source) =>
      Comment.fromMap(json.decode(source) as Map<String, dynamic>);

  String text;
  DateTime date;

  Comment copyWith({
    String? text,
    DateTime? date,
  }) {
    return Comment(
      text: text ?? this.text,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'date': date.toIso8601String(),
    };
  }

  String toJson() => json.encode(toMap());
}
