import 'package:flutter/material.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notification_example/pages/DetailNotificationPage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Notification {
  final int id;
  final String title;
  final String description;
  final String icon;
  final String body;
  const Notification(
      {this.id, this.title, this.description, this.icon, this.body});
}

Database database;
List badge;

const notification = Notification(
    id: 1,
    title:
        'HUTECH thông báo tuyển sinh đào tạo trình độ Thạc sĩ năm 2019 – Đợt 1',
    description:
        'Trường Đại học Công nghệ TP.Hồ Chí Minh (HUTECH) thông báo tuyển sinh đào tạo trình độ Thạc sĩ đợt 1 - năm 2019 với 11 chuyên ngành gồm: Kỹ thuật điện, Kỹ thuật cơ điện tử, Kỹ thuật môi trường, Kỹ thuật xây dựng, Công nghệ sinh học, Công nghệ thông tin, Công nghệ thực phẩm, Kế toán, Quản trị kinh doanh, Quản trị Dịch vụ du lịch và lữ hành, tiếng Anh.',
    body:
        '<h2>152 người Việt “biến mất” tại Đài Loan đã dấy lên rất nhiều những quan ngại sâu sắc về việc lợi dụng chính sách để phục vụ mục đích cá nhân gây ảnh hưởng đến uy tín, hình ảnh của Việt Nam.</h2> <p>Ngày 26/12, Focus Taiwan dẫn lời cục Du lịch Đài Loan cho biết, 409 trong tổng số 566 du khách nước ngoài đến Đài Loan theo chương trình nới lỏng thủ tục xin thị thực và biến mất là du khách người Việt.</p> <p>Vì đâu mà những du khách biến mất ở Đài Loan kia lại tự biến mình thành người Việt xấu xí như vậy?</p> <figure><img alt="Bạn đọc viết - Chân dung 152 người Việt xấu xí " src="https://media1.nguoiduatin.vn/media/duong-thu/2018/12/27/nguoi-viet-bien-mat-o-dai-loan.jpg" width="450" height="269"> <figcaption> <h3>Hình ảnh camera tại khách sạn ghi cảnh được cho là những người Việt "biến mất" ở Đài Loan.</h3> </figcaption> </figure> <p>Theo tìm hiểu, việc đi xuất khẩu lao động ở Đài Loan hiện nay có mức chi phí thuộc loại thấp nhất trong các nước. Với thời hạn hợp đồng 3 năm, mức chi phí đi Đài Loan chỉ từ 40 triệu đồng đến 120 triệu đồng. Đây là thông tin tham khảo từ một số địa chỉ tư vấn xuất khẩu lao động uy tín.</p> <p>Thêm nữa, các thủ tục đi Đài Loan cũng không quá phức tạp theo con đường chính thống này.</p> <p>Thế nhưng, 152 người đã bất chấp để đi theo con đường du lịch và mang về cho đất nước không phải là sự giàu mạnh, phát triển, là kinh nghiệm hay bất cứ một sự tiên tiến nào mà là bước thụt lùi về nhân cách kèm theo những rắc rối khó có thể gỡ trong ngày một ngày hai với các cơ quan quản lý Nhà nước.</p> <p>Rồi đây, họ sẽ còn phải đối mặt với những xử lý vi phạm trong việc xuất nhập cảnh, không loại trừ vi phạm cả về luật pháp. Như vậy thử hỏi có đáng không?</p> <p><em>*Bài viết thể hiện quan điểm riêng của tác giả.</em></p>');

Future setupDatabase() async {
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'demo.db');
  // // Delete the database
//     await deleteDatabase(path);

  // open the database
  database = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        'CREATE TABLE badge_setting (id TEXT PRIMARY KEY, name TEXT, count INTEGER)');

    // Insert some records in a transaction
    await db.transaction((txn) async {
      txn.rawInsert(
          'INSERT INTO badge_setting(id, name, count) VALUES("1", "notification", 0)');
      txn.rawInsert(
          'INSERT INTO badge_setting(id, name, count) VALUES("2", "card_travel", 0)');
      txn.rawInsert(
          'INSERT INTO badge_setting(id, name, count) VALUES("3", "list", 0)');
    });
  });

  List<Map> list =
      await database.rawQuery('SELECT id,name,count FROM badge_setting');
  badge = list.toList();
  return badge;
}

void increaseBadge(id) {
  setState(() {
    database.rawUpdate(
        'UPDATE badge_setting SET count = count + 1 WHERE id = ?', [id]);
  });
}

void removeBadge(id) {
  setState(() {
    database.rawUpdate('UPDATE badge_setting SET count = 0 WHERE id = ?', [id]);
  });
}

Function firebaseCloudMessaging_Listeners(BuildContext context) {
  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();
  //check permision IOS
  if (Platform.isIOS) iOS_Permission(firebaseMessaging);
  //detect event on  refresh token
  Stream<String> fcmStream = firebaseMessaging.onTokenRefresh;
  fcmStream.listen((token) {
    print('update new token');
//    update(token);
  });
  //update token to server
  firebaseMessaging.getToken().then((token) {
    print(token);
//    update(token);
  });
  //init local nofifi on two platform
  var android = new AndroidInitializationSettings('mipmap/ic_launcher');
  var ios = new IOSInitializationSettings();
  var platform = new InitializationSettings(android, ios);
  flutterLocalNotificationsPlugin.initialize(platform,
      onSelectNotification: (String payload) {
    print("on click notification");
    // print(notification);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                DetailNotificationPage(notification: notification)));
  });
  //config event revice notify on 3 state
  firebaseMessaging.configure(onMessage: (Map<String, dynamic> msg) {
    FlutterAppBadger.updateBadgeCount(3);
    increaseBadge(msg["data"]["page_id"]);
    showNotification(flutterLocalNotificationsPlugin, msg);
    //       _showBigPictureNotification();
    //        _showBigTextNotification(msg);
    // print(" onMessage called ${(msg)}");
    Fluttertoast.showToast(
        msg: "onMessage called",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM);
  }, onLaunch: (Map<String, dynamic> msg) {
    FlutterAppBadger.updateBadgeCount(3);
    increaseBadge(msg["data"]["page_id"]);
    // print(" onLaunch called ${(msg)}");
    Fluttertoast.showToast(
        msg: "onLaunch called",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                DetailNotificationPage(notification: notification)));
  }, onResume: (Map<String, dynamic> msg) {
    // print(" onResume called ${(msg)}");
    Fluttertoast.showToast(
        msg: "onResume called",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                DetailNotificationPage(notification: notification)));
  });
}

void iOS_Permission(FirebaseMessaging firebaseMessaging) {
  firebaseMessaging.requestNotificationPermissions(
      IosNotificationSettings(sound: true, badge: true, alert: true));
  firebaseMessaging.onIosSettingsRegistered
      .listen((IosNotificationSettings settings) {
    print("Settings registered: $settings");
  });
}

Future showNotification(
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
    Map<String, dynamic> msg) async {
  // if (int.tryParse(msg['type']) == 0) {
  print(msg);
  var android = new AndroidNotificationDetails(
      'your channel id', "your channel name',", "your channel description",
      //xu ly do uu tien
      priority: Priority.High,
      importance: Importance.Max);
  var iOS = new IOSNotificationDetails();
  var platform = new NotificationDetails(android, iOS);
  await flutterLocalNotificationsPlugin.show(
      0, msg["notification"]['title'], msg["notification"]['body'], platform,
      payload: msg["data"]['id']);
  // }
  //  else if (int.tryParse(msg['type']) == 1) {
  //   print('clear');
  //   deleteNotifyById(flutterLocalNotificationsPlugin, 0);
  //   var android = new AndroidNotificationDetails(
  //       'your channel id', "your channel name',", "your channel description");
  //   var iOS = new IOSNotificationDetails();
  //   var platform = new NotificationDetails(android, iOS);
  //   await flutterLocalNotificationsPlugin.show(
  //       0, 'Thông báo', 'Tin nhắn đã thu hồi', platform);
  // }
}

Future _showBigPictureNotification(
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
  var directory = await getApplicationDocumentsDirectory();
  var largeIconResponse = await http.get('http://via.placeholder.com/48x48');
  var largeIconPath = '${directory.path}/largeIcon';
  var file = new File(largeIconPath);
  await file.writeAsBytes(largeIconResponse.bodyBytes);
  var bigPictureResponse = await http.get('http://via.placeholder.com/400x800');
  var bigPicturePath = '${directory.path}/bigPicture';
  file = new File(bigPicturePath);
  await file.writeAsBytes(bigPictureResponse.bodyBytes);
  var bigPictureStyleInformation = new BigPictureStyleInformation(
      bigPicturePath, BitmapSource.FilePath,
      largeIcon: largeIconPath,
      largeIconBitmapSource: BitmapSource.FilePath,
      contentTitle: 'overridden <b>big</b> content title',
      htmlFormatContentTitle: true,
      summaryText: 'summary <i>text</i>',
      htmlFormatSummaryText: true);
  var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
      'big text channel id',
      'big text channel name',
      'big text channel description',
      style: AndroidNotificationStyle.BigPicture,
      styleInformation: bigPictureStyleInformation);
  var platformChannelSpecifics =
      new NotificationDetails(androidPlatformChannelSpecifics, null);
  await flutterLocalNotificationsPlugin.show(
      0, 'big text title', 'silent body', platformChannelSpecifics);
}

Future _showBigTextNotification(
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
    Map<String, dynamic> param) async {
  print(param['id']);
  var bigTextStyleInformation = new BigTextStyleInformation(
      'Lorem <i>ipsum dolor sit</i> amet, consectetur <b>adipiscing elit</b>, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      htmlFormatBigText: true,
      contentTitle: 'overridden <b>big</b> content title',
      htmlFormatContentTitle: true,
      summaryText: 'summary <i>text</i>',
      htmlFormatSummaryText: true);
  var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
      'big text channel id',
      'big text channel name',
      'big text channel description',
      style: AndroidNotificationStyle.BigText,
      styleInformation: bigTextStyleInformation);
  var platformChannelSpecifics =
      new NotificationDetails(androidPlatformChannelSpecifics, null);
  await flutterLocalNotificationsPlugin.show(
      0, 'big text title', 'silent body', platformChannelSpecifics,
      payload: param['id']);
}

deleteNotifyById(
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin, id) async {
  await flutterLocalNotificationsPlugin.cancel(id);
}

update(String token) {
  DatabaseReference databaseReference = new FirebaseDatabase().reference();
  databaseReference.child('fcm-token/${token}').set({"token": token});
}
