import 'package:flutter/material.dart';

class Whatisit extends StatelessWidget {
  final String dname, dinfo;

  Whatisit(this.dname, this.dinfo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dname),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Text(
            dinfo,
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
