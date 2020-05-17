import 'package:flutter/material.dart';

class Whatisit extends StatelessWidget {
  final String sname, sinfo;

  Whatisit(this.sname, this.sinfo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sname),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Text(
            sinfo,
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
