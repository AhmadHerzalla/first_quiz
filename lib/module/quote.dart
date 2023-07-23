// To parse this JSON data, do
//
//     final quote = quoteFromJson(jsonString);

import 'dart:convert';

Quote quoteFromJson(String str) => Quote.fromJson(json.decode(str));

String quoteToJson(Quote data) => json.encode(data.toJson());

class Quote {
  String content;
  String author;
  List<String> tags;

  Quote({
    required this.content,
    required this.author,
    required this.tags,
  });

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        content: json["content"],
        author: json["author"],
        tags: List<String>.from(json["tags"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "author": author,
        "tags": List<dynamic>.from(tags.map((x) => x)),
      };
}
