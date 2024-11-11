import 'dart:convert';

Photos PhotosFromJson(String str) => Photos.fromJson(json.decode(str));
String PhotoToJson(Photos data) => json.encode(data.toJson());

class Photos {
  int id;
  String title;
  String url;
  String thumbnailUrl;

  Photos(
      {required this.id,
      required this.title,
      required this.url,
      required this.thumbnailUrl});

  factory Photos.fromJson(Map<String, dynamic> json) => Photos(
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
