

import 'package:flutter/material.dart';
import 'package:flutter_app_food/screens/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Null> signOutProcess(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    //exit(0) is close app
    //exit(0);
    MaterialPageRoute newRoute = MaterialPageRoute(
      builder: (context) => Home(),
    );
    Navigator.pushAndRemoveUntil(context, newRoute, (route) => false);
}



