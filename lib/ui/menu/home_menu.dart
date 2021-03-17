import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.greenAccent,
          title: Text('Menu'),
        ),
        body: GridView.count(
          padding: EdgeInsets.all(10.0),
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 20.0,
          crossAxisCount: 3,
          children: [
            Container(
              color: Colors.red,
              height: 20,
              width: 30,
            ),
            Container(
              color: Colors.red,
              height: 20,
              width: 30,
            ),
            Container(
              color: Colors.red,
              height: 20,
              width: 30,
            ),
          ],
        ));
  }
}
