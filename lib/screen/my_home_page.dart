import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quize_flutter/module/image%20.dart';
import 'package:quize_flutter/module/network.dart';
import 'package:quize_flutter/module/page_contant.dart';
import 'package:quize_flutter/module/quote.dart';

class MyHomePage extends StatefulWidget {
  final PageContant pageContant;
  const MyHomePage({
    super.key,
    required this.pageContant,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String qouteText;
  late String author;
  String? cattogry;
  String? url;

  void getQuoteData() async {
    Network network = Network();
    Quote data = await network.getData();
    setState(() {
      qouteText = data.content;
      author = data.author;
      cattogry = data.tags[0];
    });
    MyImage data2 = await network.getImage(cattogry!);
    setState(() {
      url = data2.url;
    });
  }

  @override
  void initState() {
    qouteText = widget.pageContant.qouteText;
    author = widget.pageContant.author;
    cattogry = widget.pageContant.cattogry;
    url = widget.pageContant.url;
    //getQuoteData();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: url != null
              ? Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(url!), fit: BoxFit.fill)),
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                      child: Container(
                        decoration:
                            BoxDecoration(color: Colors.white.withOpacity(0.3)),
                        child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              const Opacity(
                                opacity: 0.3,
                                child: Image(
                                    image: AssetImage("images/quote_r.png")),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            getQuoteData();
                                          },
                                          icon: Icon(
                                            Icons.refresh,
                                            size: 40,
                                            color: Colors.green[300],
                                          ))
                                    ],
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            qouteText,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontSize: 28,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.all(24),
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: Colors.green[100],
                                              borderRadius:
                                                  BorderRadius.circular(16)),
                                          child: Text(
                                            author,
                                            style:
                                                const TextStyle(fontSize: 24),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.end,
                                  //   children: [
                                  //     Container(
                                  //       margin: const EdgeInsets.only(
                                  //           bottom: 24, right: 24),
                                  //       padding: const EdgeInsets.all(8),
                                  //       decoration: BoxDecoration(
                                  //           borderRadius:
                                  //               BorderRadius.circular(16),
                                  //           color: Colors.green[200]),
                                  //       child: TextButton(
                                  //         onPressed: () {},
                                  //         child: const Text(
                                  //           " Take Screenshot ",
                                  //           style: TextStyle(
                                  //               fontSize: 24,
                                  //               color: Colors.black),
                                  //         ),
                                  //       ),
                                  //     )
                                  //   ],
                                  // )
                                ],
                              ),
                            ]),
                      )))
              : const Center(child: CircularProgressIndicator())),
    );
  }
}
