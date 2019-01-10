import 'dart:math' as math;
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:notification_example/pages/NotificationPage.dart';
import 'package:notification_example/common/Notification.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  State<HomePage> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    firebaseCloudMessaging_Listeners(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trang chủ"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationPage()));
                },
                color: Colors.blue,
                padding: EdgeInsets.all(10.0),
                child: FutureBuilder(
                    // Column is also layout widget. It takes a list of children and
                    // arranges them vertically. By default, it sizes itself to fit its
                    // children horizontally, and tries to be as tall as its parent.
                    //
                    // Invoke "debug painting" (press "p" in the console, choose the
                    // "Toggle Debug Paint" action from the Flutter Inspector in Android
                    // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
                    // to see the wireframe for each widget.
                    //
                    // Column has various properties to control how it sizes itself and
                    // how it positions its children. Here we use mainAxisAlignment to
                    // center the children vertically; the main axis here is the vertical
                    // axis because Columns are vertical (the cross axis would be
                    // horizontal).
                    future: setupDatabase(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return new ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return new BadgeIconButton(
                                  itemCount: snapshot.data[index]
                                      ["count"], // required
                                  icon: Icon(Icons.notifications,
                                      size: 30), // required
                                  badgeColor: Colors.red, // default: Colors.red
                                  badgeTextColor:
                                      Colors.white, // default: Colors.white
                                  hideZeroCount: true, // default: true
                                  onPressed: () =>
                                      removeBadge(snapshot.data[index]["id"]));
                            });
                      } else if (snapshot.hasError) {
                        return new Text("${snapshot.error}");
                      }
                      return new Container(
                        alignment: AlignmentDirectional.center,
                        child: new CircularProgressIndicator(),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
