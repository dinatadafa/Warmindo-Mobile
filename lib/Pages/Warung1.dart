// Warung1.dart

import 'package:flutter/material.dart';

class Warung1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Warung cabang 1'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 133, 115, 157), // Purple color
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 5,
                  left: 10,
                  right: 10), // Adjusted bottom padding
              child: WarungBox(
                title: 'Warung cabang 1',
                content: 'Jl. Soekarno Hatta',
                onTap: () {
                  // Navigate to Warung1.dart when the box is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Warung1(),
                    ),
                  );
                },
                onDetailTransaksiPressed: () {
                  // Handle the "Detail Transaksi" button action for Warung1.dart
                  print('Detail Transaksi button pressed for Warung1');
                },
                onMenuPressed: () {
                  // Handle the "Menu" button action for Warung1.dart
                  print('Menu button pressed for Warung1');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WarungBox extends StatefulWidget {
  final String title;
  final String content;
  final VoidCallback onTap;
  final VoidCallback onDetailTransaksiPressed;
  final VoidCallback onMenuPressed;

  WarungBox({
    required this.title,
    required this.content,
    required this.onTap,
    required this.onDetailTransaksiPressed,
    required this.onMenuPressed,
  });

  @override
  _WarungBoxState createState() => _WarungBoxState();
}

class _WarungBoxState extends State<WarungBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(top: 10, bottom: 20),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Text(
            widget.content,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: widget.onDetailTransaksiPressed,
            child: Text('Daftar Transaksi'),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: widget.onMenuPressed,
            child: Text('Menu'),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
            ),
          ),
        ],
      ),
    );
  }
}
