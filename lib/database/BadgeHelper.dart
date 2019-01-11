import 'dart:async';
import 'dart:io' as io;
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
class BadgeHelper {
  static Database _db;
  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }
  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "badge.db");
    var theDb = await openDatabase(path, version: 1, onCreate:_onCreate);
    return theDb;
  }
  void _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE badge_setting (id TEXT PRIMARY KEY, name TEXT, count INTEGER)");
    // Insert some records in a transaction
    await db.transaction((txn) async {
      txn.rawInsert(
          'INSERT INTO badge_setting(id, name, count) VALUES("1", "notification", 0)');
      txn.rawInsert(
          'INSERT INTO badge_setting(id, name, count) VALUES("2", "card_travel", 0)');
      txn.rawInsert(
          'INSERT INTO badge_setting(id, name, count) VALUES("3", "list", 0)');
    });
  }
  Future<List<dynamic>> getBadge() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT id,name,count FROM badge_setting');
    List badge = list.toList();
    return badge;
  }
  Future increaseBadge(id) async  {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT id,name,count FROM badge_setting');
    List badge = list.toList();
    FlutterAppBadger.updateBadgeCount(badge[0]['count']+1);
    return await dbClient.rawQuery('UPDATE badge_setting SET count = count + 1 WHERE id = ?', [id]);
  }

  Future removeBadge(id) async{
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT id,name,count FROM badge_setting');
    List badge = list.toList();
    FlutterAppBadger.updateBadgeCount(badge[0]['count'] == 0 ? 0 : badge[0]['count']-1);
    return await dbClient.rawQuery('UPDATE badge_setting SET count = CASE WHEN count > 0 THEN count - 1 ELSE 0  END WHERE id = ?', [id]);
  }
}
