// ignore_for_file: file_names
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:pbp_warmindo/models/pengguna_model.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  late Database database;
  static final DbHelper dbHelper = DbHelper();
  final String tableName = 'Pengguna';
  final String idColumn = 'id';
  final String idpenggunaColumn = 'idpengguna';
  final String statusColumn = 'status';
  final String namapenggunaColumn = 'namapengguna';
  final String idroleColumn = 'idrole';
  final String passwordColumn = 'password';
  final String imageColumn = 'image';

  Future<void> initDatabase() async {
    database = await connectToDatabase();
  }

  Future<Database> connectToDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '$directory/employee.db';
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE $tableName ($idColumn INTEGER PRIMARY KEY AUTOINCREMENT, $idpenggunaColumn TEXT, $passwordColumn TEXT,'
            ' $statusColumn INTEGER, '
            '$namapenggunaColumn TEXT, $idroleColumn TEXT, $imageColumn TEXT)');
      },
      onUpgrade: (db, oldVersion, newVersion) {
        db.execute(
            'CREATE TABLE $tableName ($idColumn INTEGER PRIMARY KEY AUTOINCREMENT, $idpenggunaColumn TEXT, $passwordColumn TEXT,'
            ' $statusColumn INTEGER, '
            '$namapenggunaColumn TEXT, $idroleColumn TEXT, $imageColumn TEXT)');
      },
      onDowngrade: (db, oldVersion, newVersion) {
        db.delete(tableName);
      },
    );
  }

  Future<List<PenggunaModel>> getAllPengguna() async {
    List<Map<String, dynamic>> tasks = await database.query(tableName);
    return tasks.map((e) => PenggunaModel.fromMap(e)).toList();
  }

  insertNewPengguna(PenggunaModel penggunaModel) {
    database.insert(tableName, penggunaModel.toMap());
  }

  deletePengguna(PenggunaModel penggunaModel) {
    database
        .delete(tableName, where: '$idColumn=?', whereArgs: [penggunaModel.id]);
  }

  deletePenggunas() {
    database.delete(tableName);
  }

  updatePengguna(PenggunaModel penggunaModel) async {
    await database.update(
        tableName,
        {
          statusColumn: penggunaModel.status ? 1 : 0,
          idpenggunaColumn: penggunaModel.idpengguna,
          passwordColumn: penggunaModel.password,
          imageColumn: penggunaModel.image!.path,
          namapenggunaColumn: penggunaModel.namapengguna,
          idroleColumn: penggunaModel.idrole,
        },
        where: '$idColumn=?',
        whereArgs: [penggunaModel.id]);
  }

  updateStatus(PenggunaModel penggunaModel) {
    database.update(tableName, {statusColumn: !penggunaModel.status ? 1 : 0},
        where: '$idColumn=?', whereArgs: [penggunaModel.id]);
  }
}
