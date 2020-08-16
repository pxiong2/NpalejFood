import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app_food/screens/Home.dart';
import 'package:flutter_app_food/utilities/createDrawer.dart';
import 'package:flutter_app_food/utilities/signOut.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Customer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CustomerPage();
  }
}

class _CustomerPage extends State<Customer> {
  String fname, lname, email;

  @override
  void initState() {
    super.initState();
    findUser();
  }

  Future<Null> findUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      fname = preferences.getString('fname');
      lname = preferences.getString('lname');
      email = preferences.getString('email');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            (fname != null && lname != null) ? '$fname $lname' : 'No name'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.power_settings_new),
            onPressed: () {
              signOutProcess(context);
            },
          )
        ],
      ),
      drawer: showDrawer(),
    );
  }

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            showDrawerHeader(email),
          ],
        ),
      );
}
