import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import '../classes/global.dart' as globals;
// import '../pages/diagnosis.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
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
                    print(' guest = ${globals.isguest}');
                    if (globals.isguest) {
                      maketoast('Login to see the history', 0xff3AFF3A,
                          0xff000000); //8C8C8C
                    } else
                      Navigator.popAndPushNamed(context, 'history');
                  }),
                  listTileBuilder(Icons.info_outline, 'About the app', () {
                    Navigator.popAndPushNamed(context, 'about');
                  }),
                  !globals.isguest
                      ? listTileBuilder(Icons.account_circle, 'Logout', () {
                          print(' guest = ${globals.isguest}');
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/', (Route<dynamic> route) => false);
                        })
                      : listTileBuilder(Icons.account_circle, 'Login', () {
                          print(' guest = ${globals.isguest}');
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

  void maketoast(var text, var color1, var color2) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Color(color1),
        textColor: Color(color2),
        fontSize: 16.0);
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
