import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:mainpage/classes/global.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../classes/dummydata.dart';
import './diagnosis.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../classes/global.dart' as globals;

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  var url = 'https://hauloginok.firebaseio.com/user.json';
  var arrofsym, disease, cursym, cursymno;
  var imagesarr = [
    'qback',
    'qback2',
    'qback3',
    'qback4',
    'qback5',
    'qback6',
    'qback7',
    'qback8',
    'qback9',
    'qback10',
  ];
  var imgnum;

  _QuestionPageState() {
    disease = dis[(new Random()).nextInt(131)];
    arrofsym = sym;
    for (int i = 0; i < 8; i++) {
      int num = (new Random()).nextInt(404);
      String ok = arrofsym[i];
      arrofsym[i] = arrofsym[num];
      arrofsym[num] = ok;
    }
    cursymno = 0;
    cursym = arrofsym[cursymno++];
    imgnum = (new Random()).nextInt(10);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("./images/${imagesarr[imgnum]}.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
          child: Container(
        height: heightofdevice * 0.33,
        width: widthofdevice * 0.85,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.transparent.withOpacity(0.15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 30, left: 10, right: 10),
                  child: Text(
                    'Are you suffering from $cursym?',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(fontSize: 23),
                      color: Colors.white.withOpacity(0.9),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FlatButton(
                          splashColor: Colors.transparent,
                          onPressed: () async {
                            String record = DateFormat.yMMMMd()
                                    .format(DateTime.now())
                                    .toString() +
                                ' ' +
                                DateFormat.jm()
                                    .format(DateTime.now())
                                    .toString();
                            print(record);
                            if (cursymno == 8) {
                              maketoast('Please wait', 0xffB9B4B4, 0xffFFFFFF);
                              var response = await http.get(url);
                              var userdatamap = json.decode(response.body)
                                  as Map<String, dynamic>;
                              print(userdatamap);
                              userdatamap.forEach((id, data) async {
                                if (data['emailid'] == globals.emailid) {
                                  List<dynamic> dislist = [];
                                  List<dynamic> dates = [];
                                  if (data['history'] != null) {
                                    dislist = data['history'];
                                    dates = data['date'];
                                  }
                                  dislist.add(disease);
                                  dates.add(record);
                                  print('mili id = $id');
                                  var urlofuser =
                                      'https://hauloginok.firebaseio.com/user/$id.json';
                                  try {
                                    await http.patch(urlofuser,
                                        body: json.encode({
                                          'history': dislist,
                                        }));
                                    http.patch(urlofuser,
                                        body: json.encode({
                                          'date': dates,
                                        }));
                                  } catch (error) {
                                    print(error);
                                  }
                                }
                              });

                              Navigator.of(context).pop();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) {
                                    return Diagnosis(disease);
                                  },
                                ),
                              );
                            }
                            setState(() {
                              imgnum = (new Random()).nextInt(10);
                              cursym = arrofsym[++cursymno];
                            });
                          },
                          child: Text(
                            'Yes',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white.withOpacity(0.9)),
                          ),
                        ),
                        // VerticalDivider(),
                        FlatButton(
                          splashColor: Colors.transparent,
                          onPressed: () async {
                            String record = DateFormat.yMMMMd()
                                    .format(DateTime.now())
                                    .toString() +
                                ' ' +
                                DateFormat.jm()
                                    .format(DateTime.now())
                                    .toString();
                            if (cursymno == 8) {
                              maketoast('Please wait', 0xffB9B4B4, 0xffFFFFFF);
                              var response = await http.get(url);
                              var userdatamap = json.decode(response.body)
                                  as Map<String, dynamic>;
                              print(userdatamap);
                              userdatamap.forEach((id, data) async {
                                if (data['emailid'] == globals.emailid) {
                                  List<dynamic> dislist = [];
                                  List<dynamic> dates = [];
                                  if (data['history'] != null) {
                                    dislist = data['history'];
                                    dates = data['date'];
                                  }
                                  dislist.add(disease);
                                  dates.add(record);
                                  print('mili id = $id');
                                  var urlofuser =
                                      'https://hauloginok.firebaseio.com/user/$id.json';
                                  try {
                                    await http.patch(urlofuser,
                                        body: json.encode({
                                          'history': dislist,
                                        }));
                                    http.patch(urlofuser,
                                        body: json.encode({
                                          'date': dates,
                                        }));
                                  } catch (error) {
                                    print(error);
                                  }
                                }
                              });
                              Navigator.of(context).pop();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) {
                                    return Diagnosis(disease);
                                  },
                                ),
                              );
                            }
                            setState(() {
                              imgnum = (new Random()).nextInt(10);
                              cursym = arrofsym[++cursymno];
                            });
                          },
                          child: Text(
                            'No',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white.withOpacity(0.9)),
                          ),
                        ),
                      ],
                    ),
                    // Divider(),
                    Container(
                      margin: EdgeInsets.only(bottom: 3),
                      child: FlatButton(
                        splashColor: Colors.transparent,
                        onPressed: () async {
                          var searchurl =
                              "https://www.google.com/search?q=what is $cursym in symptoms";
                          if (await canLaunch(searchurl)) {
                            await launch(
                              searchurl,
                              forceWebView: true,
                              forceSafariVC: true,
                            );
                          } else {
                            throw 'Could not launch $searchurl';
                          }
                        },
                        child: Text(
                          'What is it?',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white.withOpacity(0.9)),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )),
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
}
