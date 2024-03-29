import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pbp_warmindo/models/pengguna_model.dart';
import 'package:provider/provider.dart';

import '../../providers/pengguna_provider.dart';

class EditPenggunaScreen extends StatefulWidget {
  final PenggunaModel penggunaModel;

  const EditPenggunaScreen({Key? key, required this.penggunaModel})
      : super(key: key);

  @override
  State<EditPenggunaScreen> createState() => _EditPenggunaScreenState();
}

class _EditPenggunaScreenState extends State<EditPenggunaScreen> {
  final List<String> roles = ["Petugas Kasir", "Petugas Pengantar Pesanan", "Petugas Dapur"];
  String selectedRole = "Petugas Kasir";
  
  // Function to pick image by camera or from gallery
  Future pickImage(BuildContext context, ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;

    Provider.of<PenggunaClass>(context, listen: false).image = File(image.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Data Karyawan',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromARGB(255, 133, 115, 157), // Purple color
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Consumer<PenggunaClass>(
        builder: (context, provider, child) => SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                TextField(
                  controller: provider.namapenggunaController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Nama Karyawan (Username)',
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: provider.idpenggunaController,
                  maxLines: null,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'ID Karyawan',
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.person_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    PopupMenuButton(
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          onTap: () => pickImage(context, ImageSource.camera),
                          child: Row(
                            children: const [
                              Icon(Icons.camera_alt_outlined),
                              SizedBox(width: 5),
                              Text('Ambil Foto'),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          onTap: () => pickImage(context, ImageSource.gallery),
                          child: Row(
                            children: const [
                              Icon(Icons.image_outlined),
                              SizedBox(width: 5),
                              Text('Pilih Foto'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Tambahkan Foto',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
                Visibility(
                  visible: provider.image != null,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          provider.image = null;
                          setState(() {});
                        },
                        child: const Icon(
                          Icons.cancel_outlined,
                          color: Colors.red,
                        ),
                      ),
                      provider.image != null
                          ? Image.file(
                              provider.image!,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            )
                          : Container(),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: widget.penggunaModel.idrole,
                  onChanged: (value) {
                    setState(() {
                      selectedRole = value!;
                      provider.idroleController.text = selectedRole; // Tambahkan baris ini
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Role',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    prefixIcon: Icon(Icons.work),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  items: roles.map((idrole) {
                    return DropdownMenuItem<String>(
                      value: idrole,
                      child: Text(idrole),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                TextField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: provider.passwordController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                // To update pengguna data
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    widget.penggunaModel.namapengguna =
                        provider.namapenggunaController.text;
                    widget.penggunaModel.password =
                        provider.passwordController.text;
                    widget.penggunaModel.idpengguna =
                        provider.idpenggunaController.text;
                    widget.penggunaModel.idrole =
                        provider.idroleController.text;
                    provider.updatePengguna(widget.penggunaModel);
                    provider.namapenggunaController.clear();
                    provider.passwordController.clear();
                    provider.idpenggunaController.clear();
                    provider.idroleController.clear();
                    provider.image = null;
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 235, 219, 241),
                  ),
                  child: const Text('Simpan Perubahan'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}