import 'package:pbp_warmindo/jsonmodels/users.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  final databaseName = "warmindo.db";

  String users =
      "create table users (id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT UNIQUE, password INTEGER)";

  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'warmindo.db');

    print("Database path: $path");

    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(users);
    });
  }

//untuk insert user
  Future<int> insertUser(Users user) async {
    final Database db = await initDB();
    return await db.insert('users', user.toMap());
  }

//untuk lihat user
  Future<List<Map<String, dynamic>>> getAllUsers() async {
    final Database db = await initDB();
    return await db.query('users');
  }

//Untuk delete user
  Future<void> deleteUser(int userId) async {
    final Database db = await initDB();
    await db.delete('users', where: 'id = ?', whereArgs: [userId]);
  }

  Future<void> closeDB() async {
    final Database db = await initDB();
    db.close();
  }

  // Login method
  Future<bool> LoginPage(Users user) async {
    final Database db = await initDB();

    var result = await db.rawQuery(
        "SELECT * FROM users WHERE username = ? AND password = ?",
        [user.username, user.password]);
    if (result.isNotEmpty) {
      return true;
    } else {
      await closeDB(); // tutup database
      return false;
    }
  }
}

// static final DatabaseHelper _instance = DatabaseHelper._internal();
// factory DatabaseHelper() => _instance;

// DatabaseHelper._internal();

// static Database? _database;
