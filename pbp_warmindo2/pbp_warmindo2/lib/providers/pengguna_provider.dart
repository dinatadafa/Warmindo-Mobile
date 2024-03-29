import 'dart:io';
import 'package:flutter/material.dart';
import '../data_repository/dbHelper.dart';
import '../models/pengguna_model.dart';

class PenggunaClass extends ChangeNotifier {
  PenggunaClass() {
    getPenggunas();
  }

  TextEditingController namapenggunaController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController idpenggunaController = TextEditingController();
  TextEditingController idroleController = TextEditingController();
  File? image;

  List<PenggunaModel> allPenggunas = [];
  List<PenggunaModel> statusPenggunas = [];

  // Getter for checking whether a user is logged in
  bool
      get isLoggedIn => /* Add your logic here based on your app requirements */
          false;

  getPenggunas() async {
    allPenggunas = await DbHelper.dbHelper.getAllPengguna();
    statusPenggunas = allPenggunas.where((e) => e.status).toList();
    notifyListeners();
  }

  insertNewPengguna() {
    PenggunaModel penggunaModel = PenggunaModel(
      namapengguna: namapenggunaController.text,
      status: false,
      password: passwordController.text,
      image: image,
      idpengguna: idpenggunaController.text,
      idrole: idroleController.text,
    );

    DbHelper.dbHelper.insertNewPengguna(penggunaModel);
    getPenggunas();
  }

  updatePengguna(PenggunaModel penggunaModel) async {
    await DbHelper.dbHelper.updatePengguna(penggunaModel);
    getPenggunas();
  }

  updateStatus(PenggunaModel penggunaModel) {
    DbHelper.dbHelper.updateStatus(penggunaModel);
    getPenggunas();
  }

  deletePengguna(PenggunaModel penggunaModel) {
    DbHelper.dbHelper.deletePengguna(penggunaModel);
    getPenggunas();
  }
}
