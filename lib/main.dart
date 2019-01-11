import 'package:flutter/material.dart';
import 'package:notification_example/pages/HomePape.dart';
import 'package:notification_example/pages/NotificationPage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Thử nghiệm thông báo',
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => new HomePage(),
          '/home': (BuildContext context) => new HomePage(),
          '/notification': (BuildContext context) => new NotificationPage(),
        });
  }
}
