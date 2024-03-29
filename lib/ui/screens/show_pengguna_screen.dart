import 'package:flutter/material.dart';
import 'package:pbp_warmindo/models/pengguna_model.dart';
import 'package:pbp_warmindo/providers/pengguna_provider.dart';
import 'package:provider/provider.dart';

import 'edit_pengguna_screen.dart';

class ShowPenggunaScreen extends StatelessWidget {
  final PenggunaModel penggunaModel;

  const ShowPenggunaScreen({Key? key, required this.penggunaModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
  
    return Consumer<PenggunaClass>(
      builder: (context, provider, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Detail Data Karyawan',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            // to navigate to EditPenggunaScreen
            InkWell(
              onTap: () {
                provider.namapenggunaController.text =
                    penggunaModel.namapengguna;
                provider.passwordController.text = penggunaModel.password;
                provider.idpenggunaController.text = penggunaModel.idpengguna;
                provider.idroleController.text = penggunaModel.idrole;
                provider.image = penggunaModel.image;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditPenggunaScreen(
                      penggunaModel: penggunaModel,
                    ),
                  ),
                );
              },
              child: const Icon(Icons.edit),
            ),
            const SizedBox(
              width: 20,
            ),
            // to delete pengguna data
            InkWell(
              onTap: () {
                provider.deletePengguna(penggunaModel);
                Navigator.pop(context);
              },
              child: const Icon(Icons.delete),
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 133, 115, 157), // Purple color
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                width: screenWidth,
                child: FractionallySizedBox(
                  widthFactor: 0.5, // Adjust the factor as needed
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: penggunaModel.image == null
                        ? const Center(
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage('images/employee.png'),
                            ),
                          )
                        : Image.file(
                            penggunaModel.image!,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  penggunaModel.namapengguna,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              buildInfoContainer('Password', penggunaModel.password, screenWidth),
              const SizedBox(
                height: 10,
              ),
              buildInfoContainer('ID Karyawan', penggunaModel.idpengguna, screenWidth),
              const SizedBox(
                height: 10,
              ),
              buildInfoContainer('Role', penggunaModel.idrole, screenWidth),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoContainer(String label, String value, double screenWidth) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(15),
      width: screenWidth * 0.8, // Adjust the width as needed
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 26,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
