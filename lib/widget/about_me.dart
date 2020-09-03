import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMe extends StatefulWidget {
  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Me'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.white, Colors.blue.shade700],
            radius: 1,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 100,
                child: Image.asset('images/logo.png'),
              ),
              Text(
                'Ung Song',
                style: GoogleFonts.dancingScript(textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              ),
              SizedBox(
                height: 50,
              ),
              Text('Master Ung'),
              Text(
                'Developer',
                style:
                    TextStyle(fontStyle: FontStyle.italic, color: Colors.pink),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
