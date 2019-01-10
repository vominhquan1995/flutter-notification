import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:notification_example/pages/NotificationPage.dart';
import 'package:notification_example/common/Notification.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:badge/badge.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  State<HomePage> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin, NotificationService {
  @override
  void initState() {
    super.initState();
    firebaseCloudMessagingListeners(context);
  }

  @override
  increaseBadge(id) {
    setState(() {
      database.rawUpdate(
          'UPDATE badge_setting SET count = count + 1 WHERE id = ?', [id]);
    });
  }

  @override
  removeBadge(id) {
    setState(() {
      database
          .rawUpdate('UPDATE badge_setting SET count = 0 WHERE id = ?', [id]);
    });
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
            new FutureBuilder(
                future: setupDatabase(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return new Badge.left(
                      borderColor: Colors.white,
                      positionRight: -10,
                      positionTop: -10,
                      isRounded: true,
                      borderSize: 2.0,
                      value: snapshot.data[0]["count"].toString(), // value to show inside the badge
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NotificationPage()));
                        },
                        color: Colors.blue,
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          // Replace with a Row for horizontal icon + text
                          children: <Widget>[
                            Icon(Icons.notifications, color: Colors.white),
                            Text(
                              "Thông báo",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ), // text to append (required)
                    );
//                    return new BadgeIconButton(
//                      itemCount: snapshot.data[0]
//                      ["count"], // required
//                      icon: Icon(Icons.notifications,
//                          size: 30), // required
//                      badgeColor: Colors.red, // default: Colors.red
//                      badgeTextColor:
//                      Colors.white, // default: Colors.white
//                      hideZeroCount: true, // default: true
//                    );
                  } else if (snapshot.hasError) {
                    return new Text("${snapshot.error}");
                  }
                  return new Container(
                    alignment: AlignmentDirectional.center,
                    child: new CircularProgressIndicator(),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
