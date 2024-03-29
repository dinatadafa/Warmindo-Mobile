import 'package:flutter/material.dart';
import 'package:pbp_warmindo/ui/screens/show_pengguna_screen.dart';

import '../../models/pengguna_model.dart';

class PenggunaWidget extends StatelessWidget {
  final PenggunaModel penggunaModel;

  const PenggunaWidget(this.penggunaModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) =>
                    ShowPenggunaScreen(penggunaModel: penggunaModel))));
      }),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        child: ListTile(
          leading: penggunaModel.image == null
              ? Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  height: double.infinity,
                  width: 70,
                  child: const Center(
                      child: CircleAvatar(
                    backgroundImage: AssetImage('images/employee.png'),
                  )))
              : Image.file(
                  penggunaModel.image!,
                  width: 70,
                  height: double.infinity,
                ),
          title: Text(penggunaModel.namapengguna),
          subtitle: Text(penggunaModel.idpengguna),
        ),
      ),
    );
  }
}
