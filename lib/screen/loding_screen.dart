import 'package:flutter/material.dart';
import 'package:quize_flutter/module/page_contant.dart';
import 'package:quize_flutter/screen/my_home_page.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State createState() => _LoadingScreentState();
}

class _LoadingScreentState extends State<LoadingScreen> {
  void getdata() async {
    PageContant pageContant = PageContant();
    await pageContant.getQuoteData();
    if (mounted) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return MyHomePage(pageContant: pageContant);
      }));
    }
  }

  @override
  void initState() {
    getdata();
    super.initState();
    // Initialize the state of the widget here.
  }

  @override
  Widget build(BuildContext context) {
    // Build the UI of the widget here.
    return const Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}
