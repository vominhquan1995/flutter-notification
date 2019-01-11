import 'package:flutter/material.dart';
class NewsPage extends StatefulWidget {
  NewsPage({Key key}) : super(key: key);
  @override
  State<NewsPage> createState() => new _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tin tức"),
      ),
      body: new Container(
          child: new Text("Đang tải...", textAlign: TextAlign.center)
      )
    );
  }
}
