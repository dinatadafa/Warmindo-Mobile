import 'package:flutter/material.dart';

class PromosiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Promosi'),
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
              child: PromosiBox(
                title: 'Promosi 1',
                content: 'Diskon 25%',
                activateButtonText: 'Activate',
                deactivateButtonText: 'Deactivate',
                onTap: () {
                  // TODO: Handle onTap for PromosiBox 1
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: PromosiBox(
                title: 'Promosi 2',
                content: 'Diskon 50%',
                activateButtonText: 'Activate',
                deactivateButtonText: 'Deactivate',
                onTap: () {
                  // TODO: Handle onTap for PromosiBox 2
                },
              ),
            ),
            Spacer(), // Use Spacer to push the button to the bottom
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Handle 'Tambah' button press
                },
                child: Text('Tambah'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PromosiBox extends StatefulWidget {
  final String title;
  final String content;
  final String activateButtonText;
  final String deactivateButtonText;
  final VoidCallback onTap;

  PromosiBox({
    required this.title,
    required this.content,
    required this.activateButtonText,
    required this.deactivateButtonText,
    required this.onTap,
  });

  @override
  _PromosiBoxState createState() => _PromosiBoxState();
}

class _PromosiBoxState extends State<PromosiBox> {
  bool isActivated = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Set width to fill the entire screen
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
                onPressed: () {
                  setState(() {
                    isActivated = !isActivated;
                  });
                  isActivated ? _activate() : _deactivate();
                },
                child: Text(isActivated
                    ? widget.deactivateButtonText
                    : widget.activateButtonText),
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

  void _activate() {
    // TODO: Implement activation logic
  }

  void _deactivate() {
    // TODO: Implement deactivation logic
  }
}
