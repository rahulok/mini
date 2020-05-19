import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class History extends StatelessWidget {
  var diseases = [];
  var thedates = [];
  History(this.diseases, this.thedates);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.7),
        title: Text('History'),
      ),
      body: diseases.length != 0
          ? Container(
              child: ListView.builder(
                itemBuilder: (context, idx) {
                  return GestureDetector(
                    child: Card(
                      elevation: 2,
                      margin: EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 5,
                        bottom: 5,
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 30,
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: FittedBox(
                              child: Text(
                                (idx + 1).toString(),
                                style: GoogleFonts.sahitya(
                                  textStyle: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        title: Padding(
                          padding: EdgeInsets.only(
                            left: 5,
                            right: 5,
                            top: 5,
                          ),
                          child: Text(
                            diseases[idx],
                            style: GoogleFonts.sahitya(
                              textStyle: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            thedates[idx],
                          ),
                        ),
                      ),
                    ),
                    onTap: () async {
                      var searchurl =
                          "https://www.google.com/search?q=what is ${diseases[idx]}";
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
                  );
                },
                itemCount: diseases.length,
              ),
            )
          : Center(
              child: Text(
              'No history to show',
              style: TextStyle(fontSize: 25),
            )),
    );
  }
}
