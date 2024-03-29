import 'package:flutter/material.dart';
import 'package:pbp_warmindo/Pages/home_page.dart';
import 'package:pbp_warmindo/data_repository/dbHelper.dart';
import 'package:pbp_warmindo/sqlite/sqlite.dart';
import 'package:provider/provider.dart';
import 'package:pbp_warmindo/login_page.dart';
import 'package:pbp_warmindo/providers/pengguna_provider.dart'; // Adjust the import path based on your project structure
import 'package:pbp_warmindo/ui/screens/main_pengguna_screen.dart';
import 'package:pbp_warmindo/ui/screens/new_pengguna_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbHelper.initDatabase(); // Initialize the database

  // Inisialisasi database helper
  // DatabaseHelper dbHelper = DatabaseHelper();

  // Tambahkan pengguna baru
  // Users newUser = Users(id: 2, username: 'Ari', password: '123');
  // await dbHelper.insertUser(newUser);

  // Delete user dari ID
  // await dbHelper.deleteUser(2);

  // Print database
  await _printDatabaseContents();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PenggunaClass()),
        // Add more providers if needed
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Warmindo',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Consumer<PenggunaClass>(
        builder: (context, penggunaProvider, child) {
          return penggunaProvider.isLoggedIn
              ? const HomePage()
              : const LoginPage();
        },
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/main_pengguna_screen': (context) => const MainPenggunaScreen(),
        '/new_pengguna_screen': (context) => const NewPenggunaScreen(),
      },
    );
  }
}

Future<void> _printDatabaseContents() async {
  DatabaseHelper dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> users = await dbHelper.getAllUsers();
  print("Database contents: $users");
}
