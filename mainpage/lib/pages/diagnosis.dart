import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../classes/global.dart' as globals;

class Diagnosis extends StatefulWidget {
  @override
  _DiagnosisState createState() => _DiagnosisState();
}

class _DiagnosisState extends State<Diagnosis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diagnosis'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: globals.heightofdevice * 0.35,
            width: double.infinity,
            child: Stack(
              children: <Widget>[
                Image.asset(
                  './images/blur.jpg',
                  fit: BoxFit.fill,
                  // width: double.infinity,
                  height: globals.heightofdevice * 0.30,
                ),
                Positioned(
                  bottom: globals.heightofdevice * 0.05,
                  left: 0,
                  child: Container(
                    width: globals.widthofdevice,
                    height: globals.heightofdevice * 0.15,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.white.withOpacity(0), Colors.white],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 7,
                    left: 20,
                    child: Text(
                      'Malaria',
                      style: GoogleFonts.iMFellFrenchCanon(
                        textStyle: TextStyle(fontSize: 45),
                      ),
                    )),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'You may be suffering from malaria',
              style: GoogleFonts.lato(
                textStyle: TextStyle(fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
