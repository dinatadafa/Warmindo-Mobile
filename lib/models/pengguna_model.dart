import 'dart:io';

class PenggunaModel {
  int? id;
  late String idpengguna;
  late bool status;
  File? image;
  late String password;
  late String namapengguna;
  late String idrole;

  PenggunaModel({
    this.id,
    required this.idpengguna,
    required this.status,
    this.image,
    required this.password,
    required this.namapengguna,
    required this.idrole,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idpengguna': idpengguna,
      'password' : password, //preparationTime
      'namapengguna' : namapengguna, //ingredients
      'idrole' : idrole, //instructions
      'status' : status ? 1 : 0, //isFavorite
      'image' : image == null ? '' : image!.path
    };
  }

  //RecipeModel = PenggunaModel
  factory PenggunaModel.fromMap(Map<String, dynamic>map) {
    return PenggunaModel(
      id: map['id'],
      idpengguna: map['idpengguna'],
      password: map['password'],
      namapengguna: map['namapengguna'],
      idrole: map['idrole'],
      status: map['status'] == 1 ? true : false,
      image: map['image'] != null ? File(map['image']) :
  null);
  }
}