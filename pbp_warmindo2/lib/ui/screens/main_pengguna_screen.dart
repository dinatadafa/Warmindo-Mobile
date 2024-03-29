import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_warmindo/providers/pengguna_provider.dart';
import 'package:pbp_warmindo/ui/screens/show_pengguna_screen.dart';

class MainPenggunaScreen extends StatelessWidget {
  const MainPenggunaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PenggunaClass>(
      builder: (BuildContext context, myProvider, Widget? child) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Data Karyawan',
            style: TextStyle(
              fontFamily: 'Trajan Pro',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.pushNamed(context, '/new_pengguna_screen');
            Navigator.pushReplacementNamed(context, '/main_pengguna_screen');
          },
          child: const Icon(Icons.add),
        ),
        backgroundColor:Color.fromARGB(255, 133, 115, 157), // Purple color,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: myProvider.allPenggunas.length,
            itemBuilder: (context, index) {
              final pengguna = myProvider.allPenggunas[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ShowPenggunaScreen(penggunaModel: pengguna),
                    ),
                  );
                },
                child: Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  color: Color.fromARGB(255, 198, 180, 208), // Ganti warna sesuai keinginan
                  child: ListTile(
                    leading: Hero(
                      tag: 'avatar_${pengguna.id}',
                      child: CircleAvatar(
                        backgroundImage: FileImage(pengguna.image!),
                        radius: 30.0,
                      ),
                    ),
                    title: Text(
                      pengguna.namapengguna,
                      style: TextStyle(
                        fontFamily: 'Trajan Pro',
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    subtitle: Text(
                      'ID Karyawan: ${pengguna.idpengguna}\nRole: ${pengguna.idrole}',
                      style: TextStyle(
                        fontFamily: 'Schyler',
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
