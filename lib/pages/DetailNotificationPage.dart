import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_view.dart';
import 'package:notification_example/common/Notification.dart';
import 'package:notification_example/database/BadgeHelper.dart';

class DetailNotificationPage extends StatefulWidget {
  //luu bien id, cau hinh bat buoc
  final notification;
  DetailNotificationPage({Key key, @required this.notification})
      : super(key: key);
  @override
  State<DetailNotificationPage> createState() =>
      new _DetailNotificationPageState();
}

class _DetailNotificationPageState extends State<DetailNotificationPage>  {
  var dbHelper = BadgeHelper();
  @override
  void initState() {
    super.initState();
    setState(() {
      this.dbHelper.removeBadge(1);
    });
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.notification.title),
        ),
        body: new SingleChildScrollView(
          child: new Center(
            child: new HtmlView(data: widget.notification.body),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
           Navigator.of(context).pop();
            // Navigator.of(context).pushNamed("/notification");
          },
          tooltip: 'Quay lại',
          child: const Icon(Icons.keyboard_return),
        ),
      ),
    );
  }
}
