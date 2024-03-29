// DetailWarung.dart

import 'package:flutter/material.dart';
import 'Warung1.dart';
import 'Warung2.dart';

class DetailWarung extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Warung'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 133, 115, 157), // Purple color
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                onDetailPressed: () {
                  // Navigate to Warung1.dart when the "Detail" button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Warung1(),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: WarungBox(
                title: 'Warung cabang 2',
                content: 'Jl. Tembalang Selatan 1',
                onTap: () {
                  // Navigate to Warung2.dart when the box is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Warung2(),
                    ),
                  );
                },
                onDetailPressed: () {
                  // Navigate to Warung2.dart when the "Detail" button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Warung2(),
                    ),
                  );
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
  final VoidCallback onDetailPressed;

  WarungBox({
    required this.title,
    required this.content,
    required this.onTap,
    required this.onDetailPressed,
  });

  @override
  _WarungBoxState createState() => _WarungBoxState();
}

class _WarungBoxState extends State<WarungBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      margin: EdgeInsets.only(top: 10, bottom: 20),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              ElevatedButton(
                onPressed: widget.onDetailPressed,
                child: Text('Detail'),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            widget.content,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
