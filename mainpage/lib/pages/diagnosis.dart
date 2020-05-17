import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../classes/global.dart' as globals;

class Diagnosis extends StatefulWidget {
  String disease;
  var dissize;
  @override
  _DiagnosisState createState() => _DiagnosisState();
  Diagnosis(this.disease) {
    if (disease.length < 25)
      dissize = 35;
    else
      dissize = 25;
    print('lenfth = ${disease.length} and disize = $dissize');
  }
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
                  bottom: 12,
                  left: 20,
                  child: Text(
                    widget.disease,
                    style: GoogleFonts.iMFellFrenchCanon(
                      textStyle: TextStyle(fontSize: widget.dissize.toDouble()),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'You may be suffering from ${widget.disease}',
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
