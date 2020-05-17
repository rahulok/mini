import 'package:flutter/material.dart';

class History extends StatelessWidget {
  var diseases = [];
  History(this.diseases);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('History')),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, idx) {
            return Text(
              diseases[idx],
              style: TextStyle(fontSize: 20),
            );
          },
          itemCount: diseases.length,
        ),
      ),
    );
  }
}
