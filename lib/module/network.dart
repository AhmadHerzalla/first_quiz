import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quize_flutter/module/image%20.dart';
import 'package:quize_flutter/module/quote.dart';

class Network {
  Future<Quote> getData() async {
    Quote finalResponse;
    http.Response response =
        await http.get(Uri.parse("https://api.quotable.io/random"));
    if (response.statusCode == 200) {
      finalResponse = Quote.fromJson(jsonDecode(response.body));

      return finalResponse;
    } else {
      return Future.error("there somehting error");
    }
  }

  Future<MyImage> getImage(String name) async {
    MyImage image;
    http.Response response = await http.get(Uri.parse(
        "https://random.imagecdn.app/v1/image?category=$name&format=json"));
    if (response.statusCode == 200) {
      image = MyImage.fromJson(jsonDecode(response.body));
      return image;
    } else {
      return Future.error("there somehting error");
    }
  }
}
