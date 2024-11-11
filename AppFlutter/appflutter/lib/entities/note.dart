import 'dart:convert';

Note NoteFromJson(String str) => Note.fromJson(json.decode(str));
String NoteToJson(Note data) => json.encode(data.toJson());

class Note {
  String title;
  int userId;
  Note({
    required this.title,
    required this.userId,
  });
  factory Note.fromJson(Map<String, dynamic> json) => Note(
        title: json["title"],
        userId: json["userId"],
      );
  Map<String, dynamic> toJson() => {
        "title": title,
        "userId": userId,
      };
}
