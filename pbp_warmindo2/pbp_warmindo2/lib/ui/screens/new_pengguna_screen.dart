import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../providers/pengguna_provider.dart';

class NewPenggunaScreen extends StatefulWidget {
  const NewPenggunaScreen({Key? key}) : super(key: key);

  @override
  State<NewPenggunaScreen> createState() => _NewPenggunaScreenState();
}

class _NewPenggunaScreenState extends State<NewPenggunaScreen> {
  final List<String> roles = ["Petugas Kasir", "Petugas Pengantar Pesanan", "Petugas Dapur"];
  String selectedRole = "Petugas Kasir";

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
        backgroundColor: Color.fromARGB(255, 133, 115, 157),
        title: const Text('Tambah Data Karyawan'),
      ),
      body: Consumer<PenggunaClass>(
        builder: (context, provider, child) => SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                TextFormField(
                  controller: provider.namapenggunaController,
                  decoration: InputDecoration(
                    labelText: 'Nama Karyawan (Username)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    prefixIcon: Icon(Icons.person),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: provider.idpenggunaController,
                  decoration: InputDecoration(
                    labelText: 'ID Karyawan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    prefixIcon: Icon(Icons.person_outline),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    PopupMenuButton(
                      itemBuilder: ((context) => [
                        PopupMenuItem(
                          onTap: (() => pickImage(context, ImageSource.camera)),
                          child: Row(
                            children: const [
                              Icon(Icons.camera_alt_outlined),
                              SizedBox(width: 5),
                              Text('Ambil Foto'),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          onTap: (() => pickImage(context, ImageSource.gallery)),
                          child: Row(
                            children: const [
                              Icon(Icons.image_outlined),
                              SizedBox(width: 5),
                              Text('Pilih Foto'),
                            ],
                          ),
                        ),
                      ]),
                    ),
                    const Text(
                      'Tambahkan Foto',
                      style: TextStyle(fontSize: 16),
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
                            )
                          : Container(),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                value: selectedRole,
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
                              const SizedBox(height: 20),
                TextFormField(
                  controller: provider.passwordController,
                  maxLines: null,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    provider.insertNewPengguna();
                    provider.namapenggunaController.clear();
                    provider.idpenggunaController.clear();
                    provider.idroleController.clear();
                    provider.passwordController.clear();
                    provider.image = null;
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 235, 219, 241),
                  ),
                  child: const Center(child: Text('Simpan Data')),
            )])))));
}}