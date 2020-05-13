import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import '../classes/global.dart' as globals;
// import '../pages/diagnosis.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: globals.heightofdevice * 0.30,
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 0),
            padding: EdgeInsets.only(bottom: 0),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  './images/drawerbackground.jpg',
                  // fit: BoxFit.fitWidth,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  left: globals.widthofdevice * 0.07,
                  bottom: 20,
                  child: Text(
                    globals.username,
                    style: GoogleFonts.quicksand(
                      textStyle: TextStyle(
                        // fontWeight: FontWeight.w700,
                        fontSize: 32,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: globals.heightofdevice * 0.70,
            margin: EdgeInsets.only(top: 0),
            padding: EdgeInsets.only(top: 0),
            child: Stack(children: <Widget>[
              Image.asset(
                './images/uni.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Column(
                children: <Widget>[
                  listTileBuilder(Icons.history, 'History', () {
                    Navigator.popAndPushNamed(context, 'history');
                  }),
                  listTileBuilder(Icons.info_outline, 'About the app', () {
                    Navigator.popAndPushNamed(context, 'about');
                  }),
                  listTileBuilder(Icons.account_circle, 'Logout', () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/', (Route<dynamic> route) => false);
                  }),
                  listTileBuilder(
                    Icons.receipt,
                    'Diagnosis',
                    () {
                      Navigator.pop(context);
                      Navigator.of(context).pushNamed('diagnosis');
                    },
                  ),
                  listTileBuilder(Icons.exit_to_app, 'Exit', () => exit(0)),
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }

  Widget listTileBuilder(icon, text, func) {
    return ListTile(
      leading: Icon(
        icon,
        size: 35,
        color: Colors.white.withOpacity(0.8),
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 22,
          color: Colors.white.withOpacity(0.8),
        ),
      ),
      onTap: func,
    );
  }
}
