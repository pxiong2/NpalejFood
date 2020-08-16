

import 'package:flutter/material.dart';

class MyStyle {
  Color amberColor = Colors.yellow.shade700;
  Color orangeColor = Colors.orange.shade500;

  SizedBox buildSizedBox() => SizedBox(
        width: 8.0,
        height: 16.0,
      );

  Text showLoGoName(String title) => Text(
        title,
        style: TextStyle(
          fontSize: 24.0,
          color: Colors.amber.shade900,
          fontWeight: FontWeight.bold,
        ),
      );

  Text buildTitle(String titleText) => Text(
        titleText,
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.orange,
        ),
      );

  Container showLoGo() {
    return Container(
      width: 120.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget noDataText(BuildContext context, String text) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  MyStyle();
}
