import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../pages/todo/todo_model.dart';

/// Singleton
class LocalRepository {
  LocalRepository._init();

  static final LocalRepository _repository = LocalRepository._init();
  static LocalRepository get instance => _repository;

  Database _db;

  Future<Database> db() async {
    if (_db != null) return _db;
    return await _initDb();
  }

  // Init database
  Future<Database> _initDb() async {
    var dbPath = await getDatabasesPath();
    var path = join(dbPath, 'myapp.db');
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(Todo.createTableSQL);
      },
    );
    return _db;
  }
}
