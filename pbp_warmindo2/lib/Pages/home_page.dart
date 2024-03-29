import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pbp_warmindo/ui/screens/main_pengguna_screen.dart';
import 'package:pbp_warmindo/providers/pengguna_provider.dart';
import 'package:provider/provider.dart';
import 'Promosi.dart';
import 'Detail_warung.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PenggunaClass>(
      builder: (context, penggunaProvider, child) {
        return Scaffold(
          backgroundColor: Color.fromARGB(255, 133, 115, 157),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 25,
                    ),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.person,
                        size: 45,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome Home,",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'OWNER',
                          style: GoogleFonts.bebasNeue(
                            fontSize: 72,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    child: Divider(
                      thickness: 1,
                      color: Color.fromARGB(255, 204, 204, 204),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "MAIN MENU",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        CustomBox(
                          title: 'Warung',
                          content: 'Detail Warung',
                          buttonText: 'Detail',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailWarung(),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 20),
                        CustomBox(
                          title: 'Karyawan',
                          content: 'Detail Karyawan',
                          buttonText: 'Detail',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainPenggunaScreen(),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 20),
                        CustomBox(
                          title: 'Promosi',
                          content: 'Detail Promosi',
                          buttonText: 'Detail',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PromosiPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class CustomBox extends StatefulWidget {
  final String title;
  final String content;
  final String buttonText;
  final VoidCallback onTap;

  CustomBox({
    required this.title,
    required this.content,
    required this.buttonText,
    required this.onTap,
  });

  @override
  _CustomBoxState createState() => _CustomBoxState();
}

class _CustomBoxState extends State<CustomBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
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
                onPressed: widget.onTap,
                child: Text(widget.buttonText),
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
