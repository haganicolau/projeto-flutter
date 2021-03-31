
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase(String tableSQL) async {

  final dbPath = await getDatabasesPath();
  final String path = join(dbPath, "alfabank.db");

  return openDatabase(path, onCreate: (db, version) {
    db.execute(tableSQL);
  }, version: 1,
      onDowngrade: onDatabaseDowngradeDelete);

}

