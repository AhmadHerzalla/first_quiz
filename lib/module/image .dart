// To parse this JSON data, do
//
//     final myImage = myImageFromJson(jsonString);

import 'dart:convert';

MyImage myImageFromJson(String str) => MyImage.fromJson(json.decode(str));

String myImageToJson(MyImage data) => json.encode(data.toJson());

class MyImage {
  String url;

  MyImage({
    required this.url,
  });

  factory MyImage.fromJson(Map<String, dynamic> json) => MyImage(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}
