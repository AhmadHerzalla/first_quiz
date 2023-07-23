import 'package:quize_flutter/module/quote.dart';

import 'image .dart';
import 'network.dart';

class PageContant {
  late String qouteText;
  late String author;
  String? cattogry;
  String? url;

  Future<void> getQuoteData() async {
    Network network = Network();
    Quote data = await network.getData();

    qouteText = data.content;
    author = data.author;
    cattogry = data.tags[0];

    MyImage data2 = await network.getImage(cattogry!);

    url = data2.url;
  }
}
