import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mainpage/classes/global.dart';
import 'package:google_fonts/google_fonts.dart';
import './whatisit.dart';

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  // final _question = ['Are you suffering from ', 'Do you have '];
  // var _rand = (new Random()).nextInt(2);
  String _disease = 'fever';
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
    print('Got here');
    imgnum = (new Random()).nextInt(10);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      // height: double.infinity,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 30, left: 10, right: 10),
                // padding: EdgeInsets.all(20),
                child: Text(
                  'Are you suffering from $_disease ?',
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
                        onPressed: () {},
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
                        onPressed: () {},
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
                      onPressed: () {
                        // Navigator.pushNamed(context, 'diagnosis');
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) {
                              return Whatisit('AIDS',
                                  'This is very harmful for your pee pee'); //Name of the page
                            },
                          ),
                        );
                      },
                      child: Text(
                        'What is it?',
                        style: TextStyle(
                            fontSize: 18, color: Colors.white.withOpacity(0.9)),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}

// Scaffold(
//       body: Container(
//         padding: EdgeInsets.all(10),
//         margin: EdgeInsets.only(
//           top: heightofdevice * 0.35,
//           bottom: widthofdevice * 0.35,
//         ),
//         height: heightofdevice * 0.3,
//         child: Card(
//           elevation: 3,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               FittedBox(
//                 child: Text(
//                   '${_question[_rand]}$_disease',
//                   style: TextStyle(
//                     fontSize: 27,
//                     fontWeight: FontWeight.bold,
//                     fontFamily: Theme.of(context).textTheme.title.fontFamily,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   RaisedButton(
//                     onPressed: () {},
//                     child: Text(
//                       'Yes',
//                       style: TextStyle(
//                           color: Theme.of(context).textTheme.button.color),
//                     ),
//                   ),
//                   Divider(
//                     indent: 20,
//                   ),
//                   RaisedButton(
//                     onPressed: () {},
//                     child: Text(
//                       'No',
//                       style: TextStyle(
//                         color: Theme.of(context).textTheme.button.color,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               ButtonTheme(
//                 minWidth: MediaQuery.of(context).size.width * 0.5,
//                 buttonColor: Theme.of(context).buttonColor,
//                 child: RaisedButton(
//                   onPressed: () {},
//                   child: Text(
//                     'What\'s it',
//                     style: TextStyle(
//                       color: Theme.of(context).textTheme.button.color,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
