// Warung2.dart

import 'package:flutter/material.dart';

class Warung2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Warung cabang 2'),
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
                right: 10,
              ),
              child: WarungBox(
                title: 'Warung cabang 2',
                content: 'Jl. Tembalang Selatan 1',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Warung2(),
                    ),
                  );
                },
                onDetailTransaksiPressed: () {
                  print('Detail Transaksi button pressed for Warung2');
                },
                onMenuPressed: () {
                  print('Menu button pressed for Warung2');
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
      padding:
          EdgeInsets.all(20), // Set padding to make buttons as big as the box
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
            widget.content, // Place Jl. Tembalang Selatan 1 below cabang 2
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: widget.onDetailTransaksiPressed,
            child: Text('Daftar Transaksi'),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50), // Set button size
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: widget.onMenuPressed,
            child: Text('Menu'),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50), // Set button size
            ),
          ),
        ],
      ),
    );
  }
}
